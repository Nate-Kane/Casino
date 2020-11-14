# GROUP: Taylor, Ian, Rachel, Nathan
require_relative "menu.rb"
require_relative "game.rb"
require_relative "deck.rb"
require_relative "high_low.rb"
require_relative "slots.rb"
require_relative "wallet.rb"

####################### Instatiate Menus
@main_menu = Menu.new(['View Games', 'View Wallet', 'Exit Casino'])
@games_menu = Menu.new(['Slots', 'High Low'])

####################### Instantiate Games
@slots = Slots.new({
  name: "Slots",
  options: ["Play", "Check Balance", "Quit to menu"]
})

@high_low = High_low.new({
  name: "High/Low",
  options: ["Play", "Check Balance", "Quit to menu"]
})

####################### Instantiate Wallet and Pot
@wallet = Wallet.new(100)
@pot = Wallet.new(0)


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
      @wallet.win_money(@pot.total)
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

def high_low_app
end

main_menu_app