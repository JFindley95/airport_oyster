class Oystercard
  attr_reader :balance, :oyster_limit, :entry_station, :exit_station, :journeys
  LIMIT = 90
  MINIMUM_CHARGE = 1

  def initialize(oyster_limit = LIMIT)
    @balance = 0
    @oyster_limit = oyster_limit
    @journeys = []
    @entry_station = entry_station
    @exit_station = exit_station

  end

  def top_up(num)
    raise "Maximum amount of £#{oyster_limit} already reached" if num + @balance > LIMIT
    @balance += num
  end

  def touch_in(entry_station)
    raise 'You need a minimum of £1 on your card to travel' if @balance < 1
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_CHARGE)
    @journeys.append ({entry_station: entry_station, exit_station: exit_station})
    @entry_station = nil
    @exit_station = exit_station
  end

  def in_journey?
    !!entry_station
  end

  ## the above method will rerturn true when the user taps in e.g !!"Paddington" = true
# when the user taps out, the entry_station value will become nil and !!nil = false
#   so this shows they are no longer in transit
#
#   => true
# 3.0.0 :002 > !!nil
# => false
# 3.0.0 :003 > !"cat"
# => false
# 3.0.0 :004 > !!"cat"
# => true

private
  def deduct(num)
    @balance -= num
  end
end
