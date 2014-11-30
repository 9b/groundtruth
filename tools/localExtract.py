import requests, sys
from BeautifulSoup import BeautifulSoup

f = open(sys.argv[1], 'r')
content = f.read()
f.close()

raw = soup = BeautifulSoup(content)

reviews = raw.findAll('div', { 'class': 'rounded_white_white_black' })
for review in reviews:
	cName = review.find('div', { 'class': 'coffee_name' }).text
	long = review.find('div', { 'class': 'coffee_review' }).find('div', { 'class': 'notes'}).findAll('p')
	compiled = ' '.join([ x.text for x in long ])	

	details = {}
	description = review.find('div', { 'class': 'coffee_data'}).findAll('div')
	details['name'] = cName
	details['description'] = compiled
	details['country'] = str(description[0].text.split(':')[1].lower().rstrip().lstrip())
	details['grade'] = str(description[1].text.split(':')[1].lower().rstrip().lstrip())
	details['region'] = description[2].text.split(':')[1].lower().rstrip().lstrip()
	details['processing'] = str(description[3].text.split(':')[1].lower().rstrip().lstrip())
	details['arrival'] = str(description[4].text.split(':')[1].lower().rstrip().lstrip())
	details['appearance'] = str(description[5].text.split(':')[1].lower().rstrip().lstrip())
	details['varietal'] = str(description[6].text.split(':')[1].lower().rstrip().lstrip())
	details['intensity'] = str(description[7].text.split(':')[1].lower().rstrip().lstrip())
	details['roast'] = str(description[8].text.split(':')[1].lower().rstrip().lstrip())
	details['compare'] = str(description[9].text.split(':')[1].lower().rstrip().lstrip())
	print details
