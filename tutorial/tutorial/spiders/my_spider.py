from scrapy.spider import BaseSpider
from scrapy.selector import Selector
from scrapy.http import FormRequest
from scrapy.http import Request
from scrapy import log
from time import sleep
import os

from tutorial.items import DmozItem

class MySpider(BaseSpider):
    # define the fields for your item here like:
   	name = "bet007.com"
   	allowed_domains = ["bet007.com","nowscore.com"]
   	start_urls = ["http://live2.titan007.com/"]
    
	def start_requests(self):
		return [FormRequest("http://bf.bet007.com/Over_matchdate.aspx",
			formdata={'matchdate':'2013-11-5'},
			callback=self.handle_mainpage)]

	def show_titles(self, row):
		cols = row.xpath('.//td/text()')
		for index, col in enumerate(cols):
			self.log('col %d is %s!' % (index,col.extract().encode('utf-8')))
	
	def handle_mainpage(self, response):
		filename = 'mainpage1.txt'
		open(filename, 'wb').write(response.body)
		dataFile = open('data.txt','w')
		sel = Selector(response)
		theTable = sel.xpath('//div[@id="schedule"]/table')
		theTableRow = theTable.xpath('.//tr')
		for index,tableRow in enumerate(theTableRow):
			if index==0:
				cols = tableRow.xpath('.//td/text()')
				for ind, col in enumerate(cols):
					if ind<7:
						dataFile.write('%d:%s ' % (ind,col.extract().encode('utf-8')))
			else:
				#dataFile.write('0: %s ' % tableRow.xpath('.//td[1]/font/text()').extract().encode('utf-8'))
				#dataFile.write('1: %s ' % tableRow.xpath('.//td[2]/text()').extract().encode('utf-8'))
				#dataFile.write('2: %s ' % tableRow.xpath('.//td[3]/text()').extract().encode('utf-8'))
				#dataFile.write('3: %s ' % tableRow.xpath('.//td[4]/text()').extract().encode('utf-8'))
				#dataFile.write('4: %s ' % tableRow.xpath('.//td[5]/text()').extract().encode('utf-8'))
				#dataFile.write('5: %s ' % tableRow.xpath('.//td[6]/text()').extract().encode('utf-8'))
				#dataFile.write('6: %s ' % tableRow.xpath('.//td[7]/font/text()').extract().encode('utf-8'))
				cols = tableRow.xpath('.//td')
				for ind, col in enumerate(cols):
					if ind==0 or ind==6:
						tempVal = col.xpath('.//font/text()').extract()
						if len(tempVal)>0:
							dataFile.write('%d:%s ' % (ind,tempVal[0].encode('utf-8')))
						else:
							dataFile.write('%d:N/A ' % ind)
					elif ind<7:
						tempVal = col.xpath('.//text()').extract()
						if len(tempVal)>0:
							dataFile.write('%d:%s ' % (ind,tempVal[0].encode('utf-8')))
						else:
							dataFile.write('%d:N/A ' % ind)
					elif ind==7:
						tempVal = col.re(r'AsianOdds\((\d+)\)')
						if len(tempVal)>0:
							asianUrl = 'http://vip.bet007.com/AsianOdds_n.aspx?id=' + tempVal[0]
							dataFile.write('%d: AsianUrl %s ' % (ind,asianUrl))
							sleep(1)
							yield Request(asianUrl,callback=self.parseAsia)
						else:
							dataFile.write('%d: AsianUrl N/A ' % ind)
						europeVal = col.re(r'EuropeOdds\((\d+)\)')
						if len(europeVal)>0:
							#europeUrl = 'http://1x2.bet007.com/oddslist/' + europeVal[0] + '.htm'
							#http://1x2.nowscore.com/935093.js
							europeUrl = 'http://1x2.nowscore.com/' + europeVal[0] + '.js'
							dataFile.write('%d: EuropeUrl %s ' % (ind,europeUrl))
							sleep(1)
							yield Request(europeUrl,callback=self.parseEroupe)
						else:
							dataFile.write('%d: EuropeUrl N/A ' % ind)
			dataFile.write('%s' % os.linesep)
			#self.show_titles(tableRow)
		dataFile.close()

	
	def parse(self, response):
		filename = 'default_page_content.txt'
		open(filename, 'wb').write(response.body)

	def parseAsia(self, response):
		filename = 'asia_' + response.url.split("=")[-1]
		open(filename, 'wb').write(response.body)

	def parseEroupe(self, response):
		filename = 'eroupe_' + response.url.split("/")[-1]
		open(filename, 'wb').write(response.body)
