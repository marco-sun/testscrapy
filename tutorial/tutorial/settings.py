# Scrapy settings for tutorial project
#
# For simplicity, this file contains only the most important settings by
# default. All the other settings are documented here:
#
#     http://doc.scrapy.org/en/latest/topics/settings.html
#

BOT_NAME = 'tutorial'

SPIDER_MODULES = ['tutorial.spiders']
NEWSPIDER_MODULE = 'tutorial.spiders'

ITEM_PIPELINES = {'tutorial.pipelines.DayMatchPipeline':300,
	'tutorial.pipelines.AsiaOddsPipeline':800,}

#FEED_URI = 'file://feedresult.csv'
#FEED_FORMAT = 'csv'
#FEED_STORAGES = {}
#FEED_EXPORTERS = {}
#FEED_STORE_EMPTY = False

# Crawl responsibly by identifying yourself (and your website) on the user-agent
#USER_AGENT = 'tutorial (+http://www.yourdomain.com)'
