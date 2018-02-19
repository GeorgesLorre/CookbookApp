# You should always start with your model.
# The most important thing in your app is your data, and using models allows you
# to manipulate whatever data you have.
# So, create a new file `recipe.rb` to define a `Recipe` class.
# It should have two instance variables, `@name` and `@description`.
#
################### MODEL ################################################

class Recipe
  attr_reader :name, :description, :duration
  def initialize(attr={})
    @name = attr[:name]
    @description = attr[:description]
    @duration = attr[:duration]
    @tried = 0
  end

  def hastried!
    @tried = 1
  end
end
