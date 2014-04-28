# Define here the models for your scraped items
#
# See documentation in:
# http://doc.scrapy.org/en/latest/topics/items.html

from scrapy.item import Item, Field

class DmozItem(Item):
    # define the fields for your item here like:
    # name = Field()
    title = Field()
    link = Field()
    desc = Field()

class DayMatchItem(Item):
	match_id = Field()
	league = Field()
	match_date = Field()
	match_status = Field()
	home_team = Field()
	match_score = Field()
	visit_team = Field()
	half_score = Field()

class AsiaOddsItem(Item):
	match_id = Field()
	odds_company = Field()
	home_odds_1 = Field()
	odds_type_1 = Field()
	visit_odds_1 = Field()
	home_odds_2 = Field()
	odds_type_2 = Field()
	visit_odds_2 = Field()

