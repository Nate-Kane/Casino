class Slots < Game
  def start_game(total)
    puts "Win big with matching numbers!"
    puts "Place bet:        (Wallet total = $#{total})"
  end

  def game_runs
    puts "Press [1] to pull lever."
    input = gets.strip.to_i
    if input == 1
      result = [rand(1..3),rand(1..3),rand(1..3)]
      puts "[#{result[0]}] [#{result[1]}] [#{result[2]}]"
    end
    if result[0] == result[1] && result[1] == result[2]
      puts "you win!"
      return true
    else
      puts "you lose!"
      return false
    end
  end

  def get_selection
    input = gets.strip
    selection = Integer(input)  
    return selection
  end
end