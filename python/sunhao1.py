import urllib2
import urllib

URL = 'http://bf.bet007.com/Over_matchdate.aspx'
URL1 = 'http://news.bet007.com/analysis/935093cn.htm'
ID = 935093
detailURL1 = "http://news.bet007.com/analysis/" + ID + "cn.htm"
#params = {'matchdate':'2013-11-5'}
#postData = urllib.urlencode(params)

#f = urllib2.urlopen(URL,postData)
f = urllib2.urlopen(URL1)
lf = open('content1.txt','w')

for line in f:
	lf.write(line)
f.close()
lf.close()

