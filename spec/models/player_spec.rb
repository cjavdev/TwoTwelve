require 'rails_helper'

RSpec.describe Player do
  let(:player) do
    player = Player.new
    player.hand = Hand.new(
      stock_pile,
      [discard_pile],
      in_hand_pile
    )
    player
  end
  let(:card1) { Card.new(1) }
  let(:card2) { Card.new(2) }
  let(:card3) { Card.new(3) }
  let(:card4) { Card.new(4) }
  let(:in_hand_pile) { InHandPile.new([card2]) }
  let(:stock_pile) { StockPile.new([card1]) }
  let(:discard_pile) { DiscardPile.new([card4]) }

  it 'picks a card from the hand' do
    allow(player).to receive(:gets).and_return("H", "0")
    card, pile = player.pick_card
    expect(card).to eq(card2)
    expect(pile).to eq(in_hand_pile)
  end

  it 'picks a card from a discard pile' do
    allow(player).to receive(:gets).and_return("D", "0")
    card, pile = player.pick_card
    expect(card).to eq(card4)
    expect(pile).to eq(discard_pile)
  end

  it 'picks the stock card' do
    allow(player).to receive(:gets).and_return("S")
    card, pile = player.pick_card
    expect(card).to eq(card1)
    expect(pile).to eq(stock_pile)
  end

  it 'pick a discard pile to discard to' do
    allow(player).to receive(:gets).and_return("D", "0")
    pile = player.pick_pile([])
    expect(pile).to eq(discard_pile)
  end

  it 'pick a building pile to play on' do
    allow(player).to receive(:gets).and_return("B", "0")
    building_pile = BuildingPile.new
    pile = player.pick_pile([building_pile])
    expect(pile).to eq(building_pile)
  end
end
