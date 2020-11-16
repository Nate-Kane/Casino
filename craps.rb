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
        return true
      elsif (dice == 2 || dice == 3 || dice == 12)
        puts "Roller craps out."
        puts "You lose..."
        return false
      else
        if (pass_line_roll(dice) == true)
          return true
        else
          return false
        end

      end
    when 2
      if (dice == 2 || dice == 3 || dice == 12)
        puts "You Win!"
        return true
      elsif (dice == 7 || dice == 11)
        puts "Roller's point is established."
        puts "You lose..."
      else
        if (dont_pass_roll(dice) == true)
          return true
        else
          return false
        end

      end
    end
  end

  def pass_line_roll (spot)
    puts "Your spot is: #{spot}."
    puts "You will roll dice until you hits 7. If your spot is rolled again, you double your money."
    puts "If you hit 7 before your number, you lose!"
    dice = @d.roll
    until (dice == spot || dice == 7)
      puts "The dealer rolls a #{dice}"
      dice = @d.roll
    end
    if dice == spot
      puts "You double your money!"
      return true
    else
      puts "You lose..."
      return false
    end
  end
  def dont_pass_roll (spot)
    puts "The roller's spot is #{spot}"
    puts "He will roll the dice until he hits 7. If 7 is rolled before his spot, you double your money."
    puts "If he rolls his spot before a 7, you lose!"
    dice = @d.roll
    until (dice == spot || dice == 7)
      puts "The dealer rolls a #{dice}"
      dice = @d.roll
    end
    if dice == 7
      puts "You double your money!"
      return true
    else
      puts "You lose..."
      return false
    end


  end

end

@wallet = Wallet.new(100)
@craps = Craps.new({
  name: "Craps",
  options: ["Play", "Check Balance", "Quit to menu"]
})
@d = Dice.new

def craps_app
  @craps.display_game
  case @craps.get_selection
  when 1
    @craps.start_game(@wallet.total)
    @wallet.bet_money
    @pot.win_money(@wallet.bet_amount)
    bet1 = @craps.pass_bet
    if (@craps.roll_result(@d.show_sum, bet1) == true)
      @wallet.win_money(@pot.total * 2)
      craps_app
    else
      craps_app
    end
  when 2
    @wallet.display_wallet
    craps_app
  when 3
    main_menu_app
  end
end