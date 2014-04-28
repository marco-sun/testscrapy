# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: http://doc.scrapy.org/en/latest/topics/item-pipeline.html

from scrapy import signals
from scrapy.exceptions import DropItem
from tutorial.items import DayMatchItem
from tutorial.items import AsiaOddsItem
from tutorial.spiders.match_spider import MatchSpider
from scrapy.contrib.exporter import CsvItemExporter

class DayMatchPipeline(object):
	def __init__(self):
		self.files = {}
		
	@classmethod
	def from_crawler(cls, crawler):
		pipeline = cls()
		crawler.signals.connect(pipeline.spider_opened, signals.spider_opened)
		crawler.signals.connect(pipeline.spider_closed, signals.spider_closed)
		return pipeline
		
	def spider_opened(self, spider):
		if isinstance(spider, MatchSpider):
			file = open('%s_main_%s.csv' % (spider.name,spider.match_date), 'w')
		else:
			file = open('%s_output.csv' % spider.name, 'w')
		self.files[spider] = file
		self.exporter = CsvItemExporter(file)
		self.exporter.start_exporting()

	def process_item(self, item, spider):
		if isinstance(item, DayMatchItem):
			self.exporter.export_item(item)
			#raise DropItem("Item handled.")
			return item
		else:
			return item
	
	def spider_closed(self, spider):
		self.exporter.finish_exporting()
		file = self.files.pop(spider)
		file.close()


class AsiaOddsPipeline(object):
	def __init__(self):
		self.files = {}
		
	@classmethod
	def from_crawler(cls, crawler):
		pipeline = cls()
		crawler.signals.connect(pipeline.spider_opened, signals.spider_opened)
		crawler.signals.connect(pipeline.spider_closed, signals.spider_closed)
		return pipeline
		
	def spider_opened(self, spider):
		if isinstance(spider, MatchSpider):
			file = open('%s_asia_%s.csv' % (spider.name,spider.match_date), 'w')
		else:
			file = open('%s_output.csv' % spider.name, 'w')
		self.files[spider] = file
		self.exporter = CsvItemExporter(file)
		self.exporter.start_exporting()

	def process_item(self, item, spider):
		if isinstance(item, AsiaOddsItem):
			self.exporter.export_item(item)
			#raise DropItem("AsiaOdds item handled.")
			return item
		else:
			return item
	
	def spider_closed(self, spider):
		self.exporter.finish_exporting()
		file = self.files.pop(spider)
		file.close()
