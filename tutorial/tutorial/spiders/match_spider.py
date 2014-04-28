from scrapy.spider import BaseSpider
from scrapy.selector import Selector
from scrapy.http import FormRequest
from scrapy.http import Request
from scrapy import log
from time import sleep
import os
import re

from tutorial.items import DayMatchItem
from tutorial.items import AsiaOddsItem

class MatchSpider(BaseSpider):
    # define the fields for your item here like:
   	name = "MatchSpider"
   	allowed_domains = ["bet007.com","nowscore.com"]
   	#start_urls = ["http://live2.titan007.com/"]

	def __init__(self, matchdate=None, *args, **kwargs):
		super(MatchSpider, self).__init__(*args, **kwargs)
		self.match_date = matchdate
		if self.match_date==None:
			self.match_date = '2013-11-5'
    
	def start_requests(self):
		self.log('formdata is %s' % self.match_date)
		return [FormRequest("http://bf.bet007.com/Over_matchdate.aspx",
			formdata={'matchdate':self.match_date},
			callback=self.handle_mainpage)]
	
	def handle_mainpage(self, response):
		sel = Selector(response)
		theTable = sel.xpath('//div[@id="schedule"]/table')
		theTableRow = theTable.xpath('.//tr')
		for index,tableRow in enumerate(theTableRow):
			if index!=0:
				matchItem = DayMatchItem()
				cols = tableRow.xpath('.//td')
				for ind, col in enumerate(cols):
					if ind==0:
						tempVal = col.xpath('.//font/text()').extract()
						if len(tempVal)>0:
							matchItem['league'] = tempVal[0]
					elif ind==1:
						tempVal = col.xpath('.//text()').extract()
						if len(tempVal)>0:
							matchItem['match_date'] = tempVal[0]
					elif ind==2:
						tempVal = col.xpath('.//text()').extract()
						if len(tempVal)>0:
							matchItem['match_status'] = tempVal[0]
					elif ind==3:
						tempVal = col.xpath('.//text()').extract()
						if len(tempVal)>0:
							matchItem['home_team'] = tempVal[0]
					elif ind==4:
						tempVal = col.xpath('.//text()').extract()
						if len(tempVal)>0:
							matchItem['match_score'] = tempVal[0]
					elif ind==5:
						tempVal = col.xpath('.//text()').extract()
						if len(tempVal)>0:
							matchItem['visit_team'] = tempVal[0]
					elif ind==6:
						tempVal = col.xpath('.//font/text()').extract()
						if len(tempVal)>0:
							matchItem['half_score'] = tempVal[0]
					elif ind==7:
						tempVal = col.re(r'AsianOdds\((\d+)\)')
						if len(tempVal)>0:
							matchItem['match_id'] = tempVal[0]
							asianUrl = 'http://vip.bet007.com/AsianOdds_n.aspx?id=' + tempVal[0]
							sleep(1)
							yield Request(asianUrl,callback=self.parseAsia)
						europeVal = col.re(r'EuropeOdds\((\d+)\)')
						if len(europeVal)>0:
							europeUrl = 'http://1x2.nowscore.com/' + europeVal[0] + '.js'
							#sleep(1)
							#yield Request(europeUrl,callback=self.parseEroupe)
				
				yield matchItem

	
	def parse(self, response):
		filename = 'default_page_content.txt'
		open(filename, 'wb').write(response.body)

	def parseAsia(self, response):
		#filename = 'asia_' + response.url.split("=")[-1]
		#open(filename, 'wb').write(response.body)
		m = re.search(r'id=(\d+)',response.url)
		if m is not None:
			match_id = m.group(1)
		else:
			match_id = 'N/A'
		sel = Selector(response)
		theTableRow = sel.xpath('//span[@id="odds"]/table/tr')
		for index,tableRow in enumerate(theTableRow):
			if index>1:
				asiaOddsItem = AsiaOddsItem()
				asiaOddsItem['match_id'] = match_id
				cols = tableRow.xpath('.//td')
				for ind, col in enumerate(cols):
					if ind==0:
						tempVal = col.xpath('.//text()').extract()
						if len(tempVal)>0:
							asiaOddsItem['odds_company'] = tempVal[0]
					elif ind==1:
						tempVal = col.xpath('.//text()').extract()
						if len(tempVal)>0:
							asiaOddsItem['home_odds_1'] = tempVal[0]
					elif ind==2:
						tempVal = col.xpath('.//text()').extract()
						if len(tempVal)>0:
							asiaOddsItem['odds_type_1'] = tempVal[0]
					elif ind==3:
						tempVal = col.xpath('.//text()').extract()
						if len(tempVal)>0:
							asiaOddsItem['visit_odds_1'] = tempVal[0]
					elif ind==4:
						tempVal = col.xpath('.//font/text()').extract()
						if len(tempVal)>0:
							asiaOddsItem['home_odds_2'] = tempVal[0]
					elif ind==5:
						tempVal = col.xpath('.//text()').extract()
						if len(tempVal)>0:
							asiaOddsItem['odds_type_2'] = tempVal[0]
					elif ind==6:
						tempVal = col.xpath('.//font/text()').extract()
						if len(tempVal)>0:
							asiaOddsItem['visit_odds_2'] = tempVal[0]
				yield asiaOddsItem


	def parseEroupe(self, response):
		filename = 'eroupe_' + response.url.split("/")[-1]
		open(filename, 'wb').write(response.body)
