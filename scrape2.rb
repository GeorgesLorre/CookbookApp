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
  attr_reader :doc
  def initialize(searchkey)
    @url = "http://www.aufeminin.com/recettes/recherche.aspx?type=all&aqt=#{searchkey}"
    @doc = Nokogiri::HTML(open(@url, :read_timeout => 10).read)
  end


  # def scrapedobject
  #   holder = []
  #   @doc.search('').each do |card|
  #     title = card.search('.recipe-card__title').text
  #     descr = card.search('.recipe-card__description').text.strip
  #     duration =  card.search('.recipe-card__duration__value').text
  #     holder << {name: title, description: descr, duration: duration}
  #   end
  #   return holder
  # end
end

# p ScrapeService.new("chocolate").scrapedobject








