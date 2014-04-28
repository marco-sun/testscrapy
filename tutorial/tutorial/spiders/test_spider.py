
from scrapy.spider import BaseSpider
from scrapy.selector import Selector

from tutorial.items import DmozItem
import re
import os

class TestSpider(BaseSpider):
    # define the fields for your item here like:
   	name = "test"
   	allowed_domains = ["nowscore.com"]
   	start_urls = ["http://1x2.nowscore.com/849213.js"]
	match_date = 'default'
	def parse(self, response):
		filename = 'test.txt'
		open(filename, 'wb').write(response.body)
		dataFile = open('eurodata.txt','w')
		
		patern1 = re.search(r'ScheduleID=(\d+);',response.body)
		if patern1 is not None:
			match_id = patern1.group(1)
		else:
			match_id = 'N/A'

		patern2 = re.search(r'game=Array\("(.*)"\)',response.body)
		if patern2 is not None:
			game_data = patern2.group(1)
		else:
			game_data = 'N/A'

		patern3 = re.search(r'gameDetail=Array\("(.*)"\)',response.body)
		if patern3 is not None:
			game_detail = patern3.group(1)
		else:
			game_detail = 'N/A'

		dataFile.write('match_id : %s ' % match_id)
		dataFile.write('%s' % os.linesep)
		dataFile.write('Game Data: %s' % os.linesep)
		for ind,onePart in enumerate(game_data.split('","')):
			dataFile.write('line %d : %s%s' % (ind,onePart,os.linesep))
		dataFile.write('Game Detail: %s' % os.linesep)
		for ind,onePart in enumerate(game_detail.split('","')):
			dataFile.write('line %d : %s%s' % (ind,onePart,os.linesep))
		
		dataFile.close()

	def parse_backup(self, response):
		sel = Selector(response)

		theTableRow = sel.xpath('//span[@id="odds"]/table/tr')
		for index,tableRow in enumerate(theTableRow):
			if index>1:
				cols = tableRow.xpath('.//td')
				for ind, col in enumerate(cols):
					if ind==0:
						tempVal = col.xpath('.//text()').extract()
						if len(tempVal)>0:
							dataFile.write('%d:%s ' % (ind,tempVal[0].encode('utf-8')))
					elif ind==1:
						tempVal = col.xpath('.//text()').extract()
						if len(tempVal)>0:
							dataFile.write('%d:%s ' % (ind,tempVal[0].encode('utf-8')))
					elif ind==2:
						tempVal = col.xpath('.//text()').extract()
						if len(tempVal)>0:
							dataFile.write('%d:%s ' % (ind,tempVal[0].encode('utf-8')))
					elif ind==3:
						tempVal = col.xpath('.//text()').extract()
						if len(tempVal)>0:
							dataFile.write('%d:%s ' % (ind,tempVal[0].encode('utf-8')))
					elif ind==4:
						tempVal = col.xpath('.//font/text()').extract()
						if len(tempVal)>0:
							dataFile.write('%d:%s ' % (ind,tempVal[0].encode('utf-8')))
						else:
							dataFile.write('%d:N/A ' % ind)
					elif ind==5:
						tempVal = col.xpath('.//text()').extract()
						if len(tempVal)>0:
							dataFile.write('%d:%s ' % (ind,tempVal[0].encode('utf-8')))
					elif ind==6:
						tempVal = col.xpath('.//font/text()').extract()
						if len(tempVal)>0:
							dataFile.write('%d:%s ' % (ind,tempVal[0].encode('utf-8')))
						else:
							dataFile.write('%d:N/A ' % ind)
				dataFile.write('%s' % os.linesep)
		dataFile.close()

		