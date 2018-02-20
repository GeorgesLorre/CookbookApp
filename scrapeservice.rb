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
require 'json'

class ScrapeService

  def initialize(searchkey)

    # @url = "https://www.marmiton.org/recettes/recherche.aspx?aqt=#{searchkey}"
    #
    @url = "banane.html"
    @doc = Nokogiri::HTML(File.open(@url))
  end

  def scrapedobject
    holder = []
    @doc.search('.recipe-card').each do |card|
      title = card.search('.recipe-card__title').text
      descr = card.search('.recipe-card__description').text.strip
      duration =  card.search('.recipe-card__duration__value').text
      holder << {name: title, description: descr, duration: duration}
    end
    p holder
    return holder
  end
end

# p ScrapeService.new("chocolate").scrapedobject








