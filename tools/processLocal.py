import requests, sys, os, hashlib

from BeautifulSoup import BeautifulSoup
from itertools import ifilter
from pymongo import MongoClient

def extractData(content):
	results = []
	raw = soup = BeautifulSoup(content)
	reviews = raw.findAll('div', { 'class': 'rounded_white_white_black' })
	for review in reviews:
		details = {}
		cName = review.find('div', { 'class': 'coffee_name' }).text
		long = review.find('div', { 'class': 'coffee_review' }).find('div', { 'class': 'notes'}).findAll('p')
		compiled = ' '.join([ x.text for x in long ])
		description = review.find('div', { 'class': 'coffee_data'}).findAll('div')
		details['name'] = cName.lstrip().rstrip().replace('  ', ' ')
		details['description'] = compiled
		details['country'] = description[0].text.split(':')[1].lower().rstrip().lstrip()
		details['grade'] = description[1].text.split(':')[1].lower().rstrip().lstrip()
		details['region'] = description[2].text.split(':')[1].lower().rstrip().lstrip()
		details['processing'] = description[3].text.split(':')[1].lower().rstrip().lstrip()
		details['arrival'] = description[4].text.split(':')[1].lower().rstrip().lstrip()
		details['appearance'] = description[5].text.split(':')[1].lower().rstrip().lstrip()
		details['varietal'] = description[6].text.split(':')[1].lower().rstrip().lstrip()
		details['intensity'] = description[7].text.split(':')[1].lower().rstrip().lstrip()
		details['roast'] = description[8].text.split(':')[1].lower().rstrip().lstrip()
		details['compare'] = description[9].text.split(':')[1].lower().rstrip().lstrip()
		results.append(details)
	return results

def mongoConnect(host, port, database, collection): 
	return MongoClient(host, port)[database][collection]

coffee = mongoConnect('127.0.0.1', 27017, 'wholebean', 'coffee')
files = ifilter(os.path.isfile, 
	map(lambda x: os.path.join(sys.argv[1], x), 
	os.listdir(os.path.expanduser(sys.argv[1])))
)

for file in files:
	content = open(file, 'r').read().strip()
	parsed = extractData(content)
	if len(parsed) == 0: continue
	coffee.insert(parsed)
