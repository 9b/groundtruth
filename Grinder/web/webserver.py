import json, os, bottle, cherrypy, datetime, operator
from cherrypy import wsgiserver
from operator import itemgetter
from bottle import route, view, run, static_file, request, abort, get, post, redirect, app, ServerAdapter, response, error
from beaker.middleware import SessionMiddleware
from requestlogger import WSGILogger, ApacheFormatter
from logging.handlers import TimedRotatingFileHandler
from random import shuffle
from sklearn.metrics.pairwise import cosine_similarity, euclidean_distances

from bson.objectid import ObjectId

import Grinder
from Grinder.web import cDb

viewsPath = os.getcwd() + '/Grinder/web/views/'
filesDir = os.getcwd() + '/Grinder/web/static'
bottle.TEMPLATE_PATH.insert(0,viewsPath)

@route('/static/<filepath:path>')
def server_static(filepath):
	return static_file(filepath, root=filesDir)

@route('/', method='GET')
@view('landing')
def _():
	links = {}
	for item in cDb.find( { 'scores': { '$exists': True } } ):
		if links.has_key(item['country']):
			links[item['country']].append({ 'aid': str(item['_id']), 'name': item['name'] })
		else:	
			links[item['country']] = [ { 'aid': str(item['_id']), 'name': item['name'] } ]
	return { 'l': links }
	
@route('/coffee/<aid>', method='GET')
@view('poc')
def _(aid):
	result = cDb.find_one({ '_id': ObjectId(aid) })
	result['_id'] = str(result['_id'])
	return { 'd': result }
	
@route('/similar', method='POST')
def similarStats():
	aid = request.json['aid']
	filters = request.json['f']

	lookup = []
	scores = []

	# grab the main coffee
	result = cDb.find_one({ '_id': ObjectId(aid) }) 
	if len(filters) == 0: compScore = result['scores'].values()
	else:
		for w in filters:
			result['scores'][w] = (result['scores'][w] + 1) * result['scores'][w]
			compScore = result['scores'].values()
	# and now the list
	for item in cDb.find( { 'scores': { '$exists': True } } ):
		if item['name'] == result['name']: continue
		
		lookup.append(item['name'] + '___' + str(item['_id']))
		if len(filters) == 0: scores.append(item['scores'].values())
		else: 
			for w in filters:
				item['scores'][w] = (item['scores'][w] + 1) * item['scores'][w]
			scores.append(item['scores'].values())
	
	matched = {}
	relations = list(euclidean_distances(compScore, scores)[0])
	for idx, item in enumerate(relations):
		matched[lookup[idx]] = item
	ordered = sorted(matched.items(), key=operator.itemgetter(1), reverse=False)

	return { 'matches': ordered[0:10] }

class Webserver():
	def __init__(self, host, port):
		self.__host = host
		self.__port = port

		session_opts = {
	    	'session.type': 'file',
		    'session.cookie_expires': 60*60*24*30,
		    'session.data_dir': './data',
		    'session.auto': True
		}

		localApp = SessionMiddleware(app(), session_opts)
		
		handlers = [ ]
		localApp = WSGILogger(localApp, handlers, ApacheFormatter())
		run(app=localApp, server='cherrypy', host=self.__host, port=self.__port, debug=True)
