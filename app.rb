# GROUP: Taylor, Ian, Rachel, Nathan
require_relative "menu.rb"
require_relative "game.rb"
require_relative "deck.rb"
require_relative "high_low.rb"
require_relative "slots.rb"
require_relative "wallet.rb"
require_relative "blackjack.rb"
require_relative "r_p_s.rb"

####################### Instatiate Menus
@main_menu = Menu.new(['View Games', 'View Wallet', 'Exit Casino'])
@games_menu = Menu.new(['Slots', 'High Low', 'Rock, Paper, Scissors'])

####################### Instantiate Games
@slots = Slots.new({
  name: "Slots",
  options: ["Play", "Check Balance", "Quit to menu"]
})

@high_low = High_low.new({
  name: "High/Low",
  options: ["Play", "Check Balance", "Quit to menu"]
})

@rock_paper_scissors = Rock_paper_scissors.new ({
  name: "Rock, Paper, Scissors",
  options: ["Play", "Check Balance", "Quit to menu"]
})

@deck = Deck.new

####################### Instantiate Wallet and Pot
@wallet = Wallet.new(100)
@pot = Wallet.new(0)

@rps = ["rock", "paper", "scissors", "rock", "paper", "scissors"]
@win = []
@lose = []
####################### APP LOGIC

def main_menu_app
  puts "\n~~~~~~~~~~~~~~~ Welcome to the Ruby Casino! ~~~~~~~~~~~~~~~~"
  @main_menu.display_menu
  main_selection = @main_menu.get_selection
  case main_selection
  when 1
    games_menu_app
  when 2
    @wallet.display_wallet
    main_menu_app
  when 3 
    exit
  end
end

def games_menu_app
  @games_menu.display_menu
  games_selection = @games_menu.get_selection
  case games_selection
  when 1 
    slots_app
  when 2
    high_low_app
  when 3
    rock_paper_scissors_app
  end
end

def slots_app
  @slots.display_game
  slots_selection = @slots.get_selection
  case slots_selection
  when 1 
    @slots.start_game(@wallet.total)
    @wallet.bet_money
    @pot.win_money(@wallet.bet_amount)
    if @slots.game_runs == true
      @wallet.win_money(@pot.total*10)
      puts @wallet.total
      games_menu_app
    else
      puts "Your wallet now has $#{@wallet.total}"
      games_menu_app
    end
  when 2 
    @wallet.display_wallet
    slots_app
  when 3 
    main_menu_app
  end
end

def rock_paper_scissors_app
  @rock_paper_scissors.display_game
  rock_paper_scissors_selection = @rock_paper_scissors.get_selection
  case rock_paper_scissors_selection
  when 1
    @rock_paper_scissors.start_game(@wallet.total)
    @wallet.bet_money
    @pot.win_money(@wallet.bet_amount)
    @rock_paper_scissors.game_runs
    if @rock_paper_scissors.continue == true
      @rock_paper_scissors.win_state
      @wallet.win_money(@pot.total*2)
      puts @wallet.total
      rock_paper_scissors_app
    else
      @rock_paper_scissors.lose_state
      puts "Your wallet now has $#{@wallet.total}"
      rock_paper_scissors_app
    end
  when 2
    @wallet.display_wallet
    rock_paper_scissors_app
  when 3 
    main_menu_app
  end
end

def high_low_app
end

main_menu_app