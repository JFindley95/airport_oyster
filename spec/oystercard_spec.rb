require 'oystercard'

  describe Oystercard do
    let(:oystercard) { Oystercard.new }
    describe '#balance' do
      it 'starts with a balance of 0' do
        expect(oystercard.balance).to eq(0)
      end
    end
    describe '#top_up' do
      it 'the balance will increase when you top up the oystercard' do
        oystercard.top_up(20)
        expect(oystercard.balance).to eq(20)
      end
      it 'raises error if top_up would bring balance over maximum' do
        oystercard.top_up(oystercard.oyster_limit)
        expect { oystercard.top_up(5) }.to raise_error("Maximum amount of £#{oystercard.oyster_limit} already reached")
      end
    end
    # describe '#deduct' do
    #   it 'the balance will descrease as the user taps out' do
    #     oystercard.top_up(20)
    #     # oystercard.deduct(5)
    #     # expect(oystercard.balance).to eq(15)
    #     expect{ oystercard.deduct(5)}.to change{ oystercard.balance}.by (-5)
    #   end
    # end
    describe '@in_journey' do
      it 'returns false ' do
        expect(oystercard.in_journey).to eq(false)
      end
    end
    describe '#touch_in' do
      it 'checks that the card has a minimum balance of £1' do
      expect{ oystercard.touch_in }.to raise_error('You need a minimum of £1 on your card to travel')
      end
      it 'will show the user is in transit' do
      oystercard.top_up(Oystercard::MINIMUM_CHARGE)
      oystercard.touch_in
      expect(oystercard.in_journey).to eq(true)
      end
    end
    describe '#touch_out' do
      it 'will show the user is NOT in transit' do
        oystercard.touch_out
        expect(oystercard.in_journey).to eq(false)
      end
      it 'will deduct the minium charge when the user touches out' do
        oystercard.top_up(5)
        oystercard.touch_in
        expect{ oystercard.touch_out }.to change{ oystercard.balance }.by(-Oystercard::MINIMUM_CHARGE)
       end
    end
  end
