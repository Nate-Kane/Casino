class Rock_paper_scissors < Game
  def start_game(total)
    puts "Best of 3!"
    puts "Place bet:        (Wallet total = $#{total})"
  end

  def game_runs
    puts "
    Make your choice!"
    make_move
    choice = gets.strip.to_i

    case choice
    when 1
      chose_rock
    when 2
      chose_paper
    when 3
      chose_scissors
    end
  end



  def chose_rock
    counter_move = @@rps.sample
    puts "
        rock vs #{counter_move}
        "
    if counter_move == "rock"
      puts "Tie! Try again"
      continue
      # don't push anything
    elsif counter_move == "paper"
      puts "You lost! Best two out of three"
      @@lose << 1
      continue
    elsif counter_move == "scissors"
      puts "You win! Best two out of three"
      @@win << 1
      continue
      end
  end


  def chose_paper
    counter_move = @@rps.sample
    puts "
        paper vs #{counter_move}
        "
    if counter_move == "paper"
      puts "Tie! Try again"
      continue
      # don't push anything
    elsif counter_move == "scissors"
      puts "You lost! Best two out of three"
      @@lose << 1
      continue
    elsif counter_move == "rock"
        puts "You win! Best two out of three"
        @@win << 1
      continue
      end
  end


  def chose_scissors
    counter_move = @@rps.sample
    puts "
        scissors vs #{counter_move}
        "
    if counter_move == "scissors"
      puts "Tie! Try again"
      continue
      # don't push anything
    elsif counter_move == "rock"
      puts "You lost! Best two out of three"
      @@lose << 1
      continue
    elsif counter_move == "paper"
        puts "You win! Best two out of three"
        @@win << 1
      continue
      end
  end





  def make_move
    puts "
    1) Rock
    2) Paper
    3) Scissors"
  end

  def continue
    if @@win.sum >= 2 && @@win.sum > @@lose.sum
      # continue to win/lose screen
      puts "
      You won! Great job. Here's your money.
      "
      puts "Your wins: #{@@win}"
      puts "Your loses: #{@@lose}"
      puts ""
      # add money
      return true
      play_again
    elsif @@lose.sum >= 2 && @@lose.sum > @@win.sum
      puts "
      Sorry, you lost.
      "
      puts "Your wins: #{@@win}"
      puts "Your loses: #{@@lose}"
      puts ""
      # lose money
      return false
      play_again
    else
      game_runs
    end
  end

  def play_again
    puts "Would you like to play again?"
    choice = gets.strip.downcase
    if choice == "yes"
      @@win.clear
      @@lose.clear
      puts "ok, here you go!"
      rock_paper_scissors
    elsif choice == "no"
      exit #go back to game menu
    else
      puts "
      INVALID INPUT
      "
      play_again
    end
  end

  def get_selection
    input = gets.strip
    selection = Integer(input)  
    return selection
  end


@@rps = ["rock", "paper", "scissors", "rock", "paper", "scissors"]
@@win = []
@@lose = []

end