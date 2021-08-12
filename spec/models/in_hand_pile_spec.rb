require 'rails_helper'

RSpec.describe InHandPile do
  let(:card7) { Card.new(7) }
  let(:card9) { Card.new(9) }
  let(:card10) { Card.new(10) }
  let(:card1) { Card.new(1) }
  let(:card2) { Card.new(2) }

  it 'removes a played card' do
    pile = InHandPile.new([card1, card2, card7, card9, card10])
    pile.remove(card1)
    expect(pile.cards).to eq([card2, card7, card9, card10])
  end

  it 'removes a played card' do
    pile = InHandPile.new([card1, card2, card7, card9, card10])
    expect {
      pile.remove(Card.new(9))
    }.to raise_error(ArgumentError)
  end
end

