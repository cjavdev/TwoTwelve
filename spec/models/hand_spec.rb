require 'rails_helper'

RSpec.describe Hand do
  it 'is dealt in with some cards' do
    h = Hand.deal_in([Card.new(1)])
    expect(h.stock_count).to eq(1)
    expect(h.stock_top).to eq(1)
    expect(h.discard_piles.length).to eq(4)
    expect(h.in_hand).to eq([])
  end

  it 'draws 5 cards from the deck' do
    hand = Hand.deal_in([])
    deck = Deck.full_deck

    hand.draw(deck)
    expect(deck.cards.count).to eq(162 - 5)
    expect(hand.in_hand_count).to eq(5)
  end

  it 'draws the right number of cards from the deck' do
    hand = Hand.new([], [], [Card.new(1)])
    deck = Deck.full_deck

    hand.draw(deck)
    expect(deck.cards.count).to eq(162 - 4)
    expect(hand.in_hand_count).to eq(5)
    expect(hand.in_hand.map(&:value)).to eq([1, :wild, :wild, :wild, :wild])
  end
end
