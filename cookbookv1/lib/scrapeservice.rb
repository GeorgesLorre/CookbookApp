# pass an url with a custom query and scrape the results into possible recipes
# for the user to store
# http://www.marmiton.org/recettes/recherche.aspx?aqt=fraise
#.recipe-card__title -> title
#.recipe-card__description -> description
#.recipe-card__duration__value -> duration
############################ SCRAPER ##########################################


require 'nokogiri'
require 'open-uri'
require_relative 'recipe'

class ScrapeService

  def initialize(searchkey)
    @url = "http://www.marmiton.org/recettes/recherche.aspx?aqt=#{searchkey}"
    @doc = Nokogiri::HTML(open(@url).read)
  end

  def scrapedobject
    holder = []
    @doc.search('.recipe-card').each do |card|
      title = card.search('.recipe-card__title').text
      descr = card.search('.recipe-card__description').text.strip
      duration =  card.search('.recipe-card__duration__value').text
      holder << Recipe.new(title,descr,duration)
    end
    return holder
  end
end

# p ScrapeService.new("chocolate").scrapedobject








