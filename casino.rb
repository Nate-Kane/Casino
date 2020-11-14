# GROUP: Taylor, Ian, Rachel, Nathan

###################### Define classes
class Menu
  def initialize (menu = [])
    @menu = menu
  end

  def display_menu
    puts ""    
    puts "Choose an option below:"
    puts ""
    @menu.each_with_index do |item, i|
      puts "#{i + 1}) #{item}"
    end
  end

  def get_selection
    input = gets.strip
    selection = Integer(input)  
    return selection
  end
end

class Game 
  def initialize (game_menu)
    @menu = game_menu
  end


  def display_game
    puts "Welcome to #{@menu[:name]}"
    puts ""
    @menu[:options].each_with_index do |name , index|
      puts "#{index + 1}) #{name}"
    end

  end

  def start_game 

  end

  #def place_bet
  
  # end

end

class Slots < Game

end

class High_Low < Game

end


class Wallet
  def initialize
  end

  def bet
  end
end

class Casino
end

####################### Instatiate Menus
main_menu = Menu.new(['View Games', 'View Wallet', 'Exit Casino'])
games_menu = Menu.new(['Slots', 'High Low'])

####################### Instantiate Games
slots = Game.new({
  name: "Slots",
  options: ["Play", "Check Balance", "Quit to menu"]
})

high_low = Game.new({
  name: "High/Low",
  options: ["Play", "Check Balance", "Quit to menu"]
})

####################### Instantiate Wallet



####################### APP LOGIC
puts "\n~~~~~~~~~~~~~~~ Welcome to the Ruby Casino! ~~~~~~~~~~~~~~~~"

main_menu.display_menu
main_selection = main_menu.get_selection
case main_selection
when 1
  games_menu.display_menu
  games_selection = games_menu.get_selection
  case games_selection
  when 1
    slots.display_game
  when 2
    high_low.display_game
  end
end


