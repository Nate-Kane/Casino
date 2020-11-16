require_relative "game.rb"
require_relative "deck.rb"

# play a card
# Higher guess again
# Lower guess again
# correct answer Good Job!
# class Card
#   # Getter and Setter methods for rank, suit and color
#   attr_accessor :rank, :suit, :color
#   # Gets called when you call the new method to create an instance
#   # card = Card.new(‘10’, ‘K’, ‘Black’)
#   def initialize(rank, suit, color)
#     @rank = rank
#     @suit = suit
#     @color = color
#   end
# end

class High_low < Game
  def start_game(total)
    puts "Win big with a correct guess!"
    puts "Place bet:        (Wallet total = $#{total})"
  end


  def game_runs
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
          return true
        else (guess == 1)
          puts "Card was lower, You lose"
          return false
        end
      elsif (first_card > second_card)
        if (guess == 2)
            puts "Card was higher, You lose"
            return true
        else (guess == 1)
            puts "Card was lower, You win"
            return false
        end
      else
        puts "It was the same card, try again"
      end)
    end
  end
end

















