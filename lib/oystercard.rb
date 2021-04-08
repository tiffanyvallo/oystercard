class Oystercard

  attr_reader :balance, :entry_station, :journey_history, :exit_station
  MAX_BALANCE = 90
  MIN_VALUE = 1

  def initialize
    @balance = 0
    @entry_station = nil
    @exit_station = nil
    @journey_history = {}
  end

  def top_up(value)
    fail "max balance #{MAX_BALANCE} reached" if @balance >= MAX_BALANCE
    fail "top up value can not be over #{MAX_BALANCE}" if value > MAX_BALANCE

    @balance += value
  end
  

  
  def touch_in(station)
    fail "Balance is less than £1" if @balance < MIN_VALUE
    @entry_station = station 
  end

  def touch_out(station)
    @exit_station = station
    @journey_history = {entry_station: @entry_station, exit_station: @exit_station}
    @entry_station = nil
    deduct(MIN_VALUE)
  end

  def in_journey?
    @entry_station != nil
  end
  
  private

  def deduct(value)
    @balance -= value
  end

end
