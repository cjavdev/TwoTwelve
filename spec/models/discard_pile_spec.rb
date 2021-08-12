require 'rails_helper'

RSpec.describe DiscardPile do
  let(:card7) { Card.new(7) }
  let(:card9) { Card.new(9) }
  let(:card10) { Card.new(10) }

  it 'can remove a card' do
    pile = DiscardPile.new([card10, card9, card7])
    pile.remove(card7)

    expect(pile.cards.length).to eq(2)
    expect(pile.cards).to eq([card10, card9])
  end

  it 'cannot remove a card that is not at the top' do
    pile = DiscardPile.new([card10, card9, card7])

    expect {
      pile.remove(card9)
    }.to raise_error(ArgumentError)
  end

  it 'cannot remove a card that is not in the pile' do
    pile = DiscardPile.new([])

    expect {
      pile.remove(card9)
    }.to raise_error(ArgumentError)
  end
end
