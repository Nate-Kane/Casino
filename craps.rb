require_relative "game.rb"
require_relative "dice.rb"
require_relative "wallet.rb"
class Craps < Game

##pass line bet
##come-out roll
  #if 7 or 11 pass bet wins
  #if 2,3 or 12, dont pass wins
  #if any other number, set that number to point bet
    #continue to roll until 7, 2, 3, 11, or 12 is rolled

  def start_game (total)
    puts "You can win various amaounts in this game"
    puts "What is your starting bet? Wallet total: #{total}"

  end

  def pass_bet 
    puts "Will you bet pass line or don't pass line?"
    puts "1.) Pass Line"
    puts "2.) Don't Pass Line"
    starting_bet = gets.chomp.to_i
    return starting_bet 
  end


  def roll_result (dice, pass_choice)
    case pass_choice
    when 1
      if (dice == 7 || dice == 11)
        puts "You win!"
      elsif (dice == 2 || dice == 3 || dice == 12)
        puts "Roller craps out."
        puts "You lose..."
      else
        puts "Second roll logic here"
      end
    when 2
      if (dice == 2 || dice == 3 || dice == 12)
        puts "You Win!"
      elsif (dice == 7 || dice == 11)
        puts "Roller point is established."
        puts "You lose..."
      else
        puts "Second roll logic here"
      end
    end
  end
end




