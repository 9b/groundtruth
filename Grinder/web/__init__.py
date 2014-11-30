from datetime import timedelta
from pymongo import MongoClient
from celery import Celery

import Grinder
	
def mongoConnect(host, port, database, collection):
	return MongoClient(host, port)[database][collection]

config = Grinder.config
config['datastore'] = {}
config['datastore']['dbHost'] = '127.0.0.1'
config['datastore']['dbPort'] = 27017
config['datastore']['dbName'] = 'wholebean'

cDb = mongoConnect(config['datastore']['dbHost'], int(config['datastore']['dbPort']), config['datastore']['dbName'], "coffee")