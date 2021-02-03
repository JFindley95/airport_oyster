class Oystercard
  attr_reader :balance, :oyster_limit, :in_journey
  LIMIT = 90
  MINIMUM_CHARGE = 1

  def initialize(oyster_limit = LIMIT)
    @balance = 0
    @oyster_limit = oyster_limit
    @in_journey = false
  end

  def top_up(num)
    raise "Maximum amount of £#{oyster_limit} already reached" if num + @balance > LIMIT
    @balance += num
  end

  def touch_in
    raise 'You need a minimum of £1 on your card to travel' if @balance < 1
    @in_journey = true
  end

  def touch_out
    deduct(MINIMUM_CHARGE)
    @in_journey = false
  end

private
  def deduct(num)
    @balance -= num
  end
end
