class Oystercard

  attr_reader :balance
  MAX_BALANCE = 90

  def initialize
    @balance = 0
  end

  def top_up(value)
    fail "max balance #{MAX_BALANCE} reached" if @balance >= MAX_BALANCE
    @balance += value
  end

end
