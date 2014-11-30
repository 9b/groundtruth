import sys, collections

from pymongo import MongoClient

def mongoConnect(host, port, database, collection):
	return MongoClient(host, port)[database][collection]

coffee = mongoConnect('127.0.0.1', 27017, 'wholebean', 'coffee')

lines = [ x.strip() for x in open(sys.argv[1]).readlines() ]
for line in lines[1:]:
	p = line.split('\t')
	name = p[1].rstrip().lstrip()
	scores = {
		'dry_fragrance': float(p[2]),
		'wet_aroma': float(p[3]),
		'brightness': float(p[4]),
		'flavor': float(p[5]),
		'body': float(p[6]),
		'finish': float(p[7]),
		'sweetness': float(p[8]),
		'clean_cup': float(p[9]),
		'complexity': float(p[10]),
		'uniformity': float(p[11]),
		'cupper_correction': float(p[12])
	}
	coffee.update( { 'name':name }, { '$set': { 'scores': scores, 'totalScore': float(p[13]) } })
