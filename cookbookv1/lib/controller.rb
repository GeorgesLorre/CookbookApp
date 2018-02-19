# The controller will gather data from the cookbook to hand them over to the view.
# It will also ask the view for information to create new recipes.
# Here are the methods to implement:
# - `initialize(cookbook)` takes an instance of the `Cookbook` as an argument.
# - `list` all the recipes
# - `create` a new recipe
# - `destroy` an existing recipe
#
#                  REPO <> CONTROllER <> VIEW
#
#################### CONTROLLER ################################################
require_relative 'view'
require_relative 'recipe'
require_relative 'scrapeservice'

class Controller
  # take an instance of class cookbook
  def initialize(a_cook_book)
    @cookbook = a_cook_book
    @viewer = View.new
  end

  # call the all method from Cookbook to return all recipes
  def list
    @viewer.listrecipes(@cookbook.all)
  end

  def goscrape
    key = @viewer.ask_user_for_keyword
    holder = ScrapeService.new(key).scrapedobject
    @viewer.listrecipes(holder)
    index = @viewer.ask_user_for_index.to_i - 1
    recipe = holder[index]
    recipe.hastried! if @viewer.have_you_tried == "y"
    @cookbook.add_recipe(holder[index])
  end

  # call the add_recipe method from Cookbook to add a recipe
  def create
    holder = @viewer.ask_for_new_recipe
    recipe = Recipe.new(holder[0], holder[1], holder[2])
    recipe.hastried! if @viewer.have_you_tried == "y"
    @cookbook.add_recipe(recipe)
  end

  # call the remove_recipe method frm Cookbook to remove a recipe
  def destroy
    @viewer.listrecipes(@cookbook.all)
    index = @viewer.ask_user_for_index.to_i - 1
    @cookbook.remove_recipe(index)
    @viewer.listrecipes(@cookbook.all)
  end
end
