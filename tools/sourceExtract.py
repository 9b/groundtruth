import requests, sys
from BeautifulSoup import BeautifulSoup

url = 'http://www.sweetmarias.com/coffee.archive.new.php?source=side'
response = requests.get(url)
raw = soup = BeautifulSoup(response.content)

#table = raw.find('table').findAll('tr')[2]
listings = raw.find('form', { 'action': 'coffee.archive.new.php' }).find('select', { 'id': 'country2' }).findAll('option')
for listing in listings[1:]:
	print "wget 'http://www.sweetmarias.com/coffee.archive.new.php?country=%s'" % listing['value']
