class Oystercard
  attr_reader :balance, :oyster_limit
  LIMIT = 90
  def initialize(oyster_limit = LIMIT)
    @balance = 0
    @oyster_limit = oyster_limit
  end
  def top_up(num)
    raise "Maximum amount of #{oyster_limit} already reached" if num + @balance > LIMIT
    @balance += num
  end
end
