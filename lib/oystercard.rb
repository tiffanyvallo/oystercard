class Oystercard

  attr_reader :balance
  MAX_BALANCE = 90
  MIN_BALANCE = 1
  def initialize
    @balance = 0
    @journey = false
  end

  def top_up(value)
    fail "max balance #{MAX_BALANCE} reached" if @balance >= MAX_BALANCE
    fail "top up value can not be over #{MAX_BALANCE}" if value > MAX_BALANCE

    @balance += value
  end
  
  def deduct(value)
    @balance -= value
  end
  
  def touch_in
    fail "Balance is less than £1" if @balance < MIN_BALANCE

   @journey = true
  end

  def touch_out
    @journey = false
  end

  def in_journey?
    @journey
  end
 
end
