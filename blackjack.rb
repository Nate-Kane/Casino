require_relative "game.rb"
require_relative "deck.rb"
require_relative "card.rb"
class Blackjack < Game
  def initialize (deck = Deck.new)
    @deck = deck
  end

  def deck
    @deck.display_cards
  end
  def start_game(total)
    puts "Let's play Blackjack!"
    puts "Place bet:        (Wallet total = $#{total})"
  end

  def game_runs
    puts "Press [1] to deal."
    input = gets.strip.to_i
    if input == 1

      dealer_hand = [@deck.sample]
      player_hand = [@deck.sample]

      puts dealer_hand
      puts player_hand
    end
  end
  
end


blackjack = Blackjack.new
blackjack

# blackjack.game_runs




