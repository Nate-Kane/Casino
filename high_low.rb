require_relative "game.rb"
require_relative "deck.rb"

#play a card
#Higher guess again
#Lower guess again
#correct answer Good Job!
class Card
  # Getter and Setter methods for rank, suit and color
  attr_accessor :rank, :suit, :color
  # Gets called when you call the new method to create an instance
  # card = Card.new(‘10’, ‘K’, ‘Black’)
  def initialize(rank, suit, color)
    @rank = rank
    @suit = suit
    @color = color
  end
end
class Highlow < Game
  

  def play 
    first_card = @randomdeck.cards.sample.rank
    puts "The first card is #{first_card}"
    puts "Guess higher or lower"
    puts "1 is lower, 2 is higher"
    guess = gets.chomp.to_i
    second_card = @randomdeck.cards.sample.rank
    puts "The second card #{second_card}"
    if (guess == 0)  
      puts "integer"
    else
      (if (first_card < second_card)     
        if (guess == 2)
          puts "Card was higher, You win"
        else (guess == 1)
          puts "Card was lower, You lose"
        end
      elsif (first_card > second_card)
        if (guess == 2)
            puts "Card was higher, You lose"
        else (guess == 1)
            puts "Card was lower, You win"
        end
      else
        puts "It was the same card, try again"
      end)
    end

    




  end
end

@deck = Deck.new
high_low = Highlow.new({
  name: "High/Low",
  options: ["Play", "Check Balance", "Quit to menu"]
})

high_low.display_game
highlow_menu_selection = high_low.get_selection
puts highlow_menu_selection
if ( highlow_menu_selection == 1)
  high_low.play
elsif ( highlow_menu_selection == 2)
  #wallet value
else
  #quit to main menu
end