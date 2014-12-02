# GroundTruth

A simple web application to display data collected from [Sweet Maria's roasters](http://www.sweetmarias.com/). It should be noted that the data collected was from 2008 until recent and each coffee score was manually transcribed from the review photo. 

![Sample coffee review](https://github.com/9b/groundtruth/blob/master/data/gt.png "Coffee Review")

## Getting up and running

Included in the repo are all the web pages of reviews from Sweet Marias. Local processing was needed due to some strange HTML errors which would cause BeautifulSoup to miss data. processLocal will extract all the needed data from the coffee review and then insert it into the database.

<pre>
python processLocal.py ../data/webpages/
</pre>

Once the reviews have been extracted, you need to pair up the data with the actual coffee scores. nameMatch will take the coffee name and pair it up with it's proper score. 

<pre>
python nameMatch.py ../data/coffeeData.tsv 
</pre>

You are now ready to run the web server.

<pre>
python www.py 80
</pre>




