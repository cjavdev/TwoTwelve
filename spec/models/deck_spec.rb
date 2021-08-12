require 'rails_helper'

RSpec.describe Deck do
  it 'should have 162 cards to start' do
    d = Deck.full_deck
    expect(d.cards.length).to eq(162)
  end

  it 'should support shuffling' do
    d = Deck.full_deck
    card_values = d.cards.map(&:value)
    d.shuffle!
    expect(d.cards.map(&:value)).not_to eq(card_values)
  end

  [5, 10, 15].each do |num_cards|
    it "should deal #{num_cards} cards" do
      d = Deck.full_deck
      card_values = d.cards.map(&:value)

      cards = d.deal(num_cards)
      expect(cards.length).to eq(num_cards)
      expect(d.cards.length).to eq(162 - num_cards)
    end
  end

end
