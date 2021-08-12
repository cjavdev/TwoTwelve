require 'rails_helper'

RSpec.describe Player do
  it 'picks a card from the hand' do
    player = Player.new
    allow(player).to receive(:gets).and_return("H", "0")
    card1 = Card.new(1)
    card2 = Card.new(2)
    player.hand = Hand.new([card1], [], [card2])

    card = player.pick_card
    expect(card).to eq(card2)
  end

  it 'picks a card from a discard pile' do
    player = Player.new
    allow(player).to receive(:gets).and_return("D", "0")
    card1 = Card.new(1)
    card2 = Card.new(2)
    card3 = Card.new(3)
    player.hand = Hand.new([card1], [[card3], [], [], []], [card2])

    card = player.pick_card
    expect(card).to eq(card3)
  end

  it 'picks the stock card' do
    player = Player.new
    allow(player).to receive(:gets).and_return("S")
    card1 = Card.new(1)
    card2 = Card.new(2)
    card3 = Card.new(3)
    player.hand = Hand.new([card1], [[card3], [], [], []], [card2])

    card = player.pick_card
    expect(card).to eq(card1)
  end

end
