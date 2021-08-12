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
end
