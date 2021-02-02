To test top_up method manually, load up irb and type in the following:

oyster1 = Oystercard.new
oyster1.balance
oyster1.top_up(20)
oyster1.balance => 20

To test the maximum top_up limit:

oyster1 = Oystercard.new
oyster1.balance
oyster1.top_up(90)
oyster1.balance
oyster.top_up(5)
oyster1.balance => "Reached maximum limit"
