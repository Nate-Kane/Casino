class Wallet
  attr_accessor :total
  def initialize (total)
    @total = total
  end

  def total
    @total
  end

  def display_wallet
    puts "Your wallet has $#{@total} in it."
  end

  def bet_money
    @bet_amount = gets.strip.to_i
    @total -= @bet_amount
  end

  def bet_amount
    @bet_amount
  end

  def lose_money (betamount)
    @total -= betamount
  end

  def win_money (betamount)
    @total += betamount * 2
  end
end