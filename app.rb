require "sinatra"
require "sinatra/reloader" if development?
require "pry-byebug"
require "better_errors"

require_relative 'cookbook'
require_relative 'scrapeservice'

csv_file   = File.join(__dir__, 'recipes.csv')
cookbook   = Cookbook.new(csv_file)

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

get '/' do
  @recipearray = cookbook.all
  erb :index
end

get '/addcustom' do
  erb :addcustom
end

post '/addcustom' do

  @new_recipe = {name: params[:name],
                 description: params[:description],
                 duration: params[:duration]}
  cookbook.add_recipe(Recipe.new(@new_recipe))
  redirect '/'
end

post '/remove' do
  params = JSON.parse(request.body.read)
  cookbook.remove_recipe(params["index"].to_i)
  redirect '/'
end

get '/lookup' do
  erb :lookup
end

post "/lookup" do
  p params
  p @holder = ScrapeService.new(params[:key]).scrapedobject

  erb :lookup
end

post '/tester' do
  # p params
  @test = params
  p @test
 @test["p"].each do |hash|
    if hash['on']
      cookbook.add_recipe(Recipe.new(hash))
    end
  end
  erb :tester
end
