# gets user input and displays(puts) back the reslult
#
#                  REPO <> CONTROLLER <> VIEW
################### VIEW ################################################
#

class View
  # show/puts the list to the user
  def listrecipes(recipearray)
    recipearray.each_with_index do |line, i|
      puts "#{i + 1}:  #{line.tried.to_i == 1 ? "[X]" : "[ ]" }  ### #{line.name} #####"
      puts "#{line.description} \n duration: #{line.duration}"
      puts "##################################"
    end
    puts "# size of list : #{recipearray.size}"
  end

  # ask the user for input to browse the main menu
  def ask_user_for_task
    puts "task?"
    return gets.chomp
  end

  def ask_user_for_keyword
    puts "What ingredient would you like a recipe for?"
    return gets.chomp
  end

  def have_you_tried
    puts "have you tried this recipe? y/n"
    return gets.chomp
  end

  # ask an index number for deletion
  def ask_user_for_index
    puts "index?"
    return gets.chomp
  end

  def ask_for_new_recipe
    holder = []
    puts "recipe name ?"
    holder << gets.chomp
    puts "description?"
    holder << gets.chomp
    puts "duration?"
    holder << gets.chomp
    return holder
  end
end
