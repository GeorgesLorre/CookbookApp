# Implement a `Cookbook` class which will act as fake database.
# It should implement 4 methods:
# - `initialize(csv_file_path)` which loads existing `Recipe` from the CSV
# - `all` which returns all the recipes
# - `add_recipe(recipe)` which adds a new recipe to the cookbook
# - `remove_recipe(recipe_index)` which removes a recipe from the cookbook.
#                  REPO <> CONTROllER <> VIEW
#
#################### REPO / DB ################################################

require 'csv'
require_relative 'recipe'

class Cookbook
  attr_reader :recipearray
  def initialize(csv_file_path)
    @recipearray = []
    @csv_location = csv_file_path
    CSV.read(csv_file_path).each do |x|
      holder = Recipe.new(x[0], x[1], x[2], x[3].to_i)
      @recipearray << holder
    end
  end

  # return each recipe in the csv with the description
  def all
    return @recipearray
  end

  # write new recipes in the csv
  def add_recipe(new_recipe)
    @recipearray << new_recipe
    update_csv
  end

  def add_temp_recipe(array_of_recipes)
  end

  # remove a recipe in the csv by index?
  def remove_recipe(recipe_index)
    @recipearray.delete_at(recipe_index)
    update_csv
  end

private

 # method for updating the current list to the csv
  def update_csv
    CSV.open(@csv_location, "w") do |line|
      @recipearray.each do |x|
        line << [x.name, x.description, x.duration, x.tried]
      end
    end
  end

end
