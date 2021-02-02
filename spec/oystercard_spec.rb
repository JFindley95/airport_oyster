require 'oystercard'

  describe Oystercard do
    let(:oystercard) { Oystercard.new(90) }
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

        expect { oystercard.top_up(5) }.to raise_error("Maximum amount of #{oystercard.oyster_limit} already reached")
      end
      end
  end
