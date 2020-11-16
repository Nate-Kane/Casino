class Game 
  def initialize (game_menu)
    @menu = game_menu
    @randomdeck = Deck.new
  end

  def display_game
    puts "Welcome to #{@menu[:name]}"
    puts ""
    @menu[:options].each_with_index do |name , index|
      puts "#{index + 1}) #{name}"
    end
  end

  def get_selection
    input = gets.strip
    selection = Integer(input)  
    return selection
  end
end