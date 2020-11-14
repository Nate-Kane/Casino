class Menu
  def initialize (menu = [])
    @menu = menu
  end

  def display_menu
    puts ""    
    puts "Choose an option below:"
    puts ""
    @menu.each_with_index do |item, i|
      puts "#{i + 1}) #{item}"
    end
  end

  def get_selection
    input = gets.strip
    selection = Integer(input)  
    return selection
  end
end