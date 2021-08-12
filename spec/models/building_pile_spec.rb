require 'rails_helper'

RSpec.describe BuildingPile do

  it 'shows the top card' do
    card3 = Card.new(3)
    pile = BuildingPile.new([Card.new(1), WildCard.new, card3])
    expect(pile.top_card).to eq(card3)
    card4 = Card.new(4)
    pile = BuildingPile.new([Card.new(1), WildCard.new, card3, card4])
    expect(pile.top_card).to eq(card4)
  end

  it 'validates a first card to be moved there' do
    card1 = Card.new(1)
    pile = BuildingPile.new([])
    expect(pile.valid?(card1)).to be true
  end

  it 'fails validation for a #2 on the first card' do
    card2 = Card.new(2)
    pile = BuildingPile.new([])
    expect(pile.valid?(card2)).to be false
  end

  it 'validates a first wild card to be moved there' do
    card1 = WildCard.new
    pile = BuildingPile.new([])
    expect(pile.valid?(card1)).to be true
  end

  it 'validates a first wild card to be moved there' do
    card1 = WildCard.new
    pile = BuildingPile.new([Card.new(1)])
    expect(pile.valid?(card1)).to be true
  end

  it 'validates a second card to be moved there' do
    card2 = Card.new(2)
    pile = BuildingPile.new([Card.new(1)])
    expect(pile.valid?(card2)).to be true
  end
end
