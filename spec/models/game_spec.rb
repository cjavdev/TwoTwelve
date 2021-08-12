require 'rails_helper'

RSpec.describe Game do

  it 'is setup with n players' do
    g = Game.new([Player.new, Player.new], nil)
    expect(g.players.count).to eq(2)
  end

  it 'deals in all the players' do
    deck = Deck.full_deck
    player1 = Player.new
    player2 = Player.new
    n = 10
    g = Game.new([player1, player2], deck)
    g.deal_in(n)

    expect(player1.hand.stock_count).to eq(n)
    expect(player2.hand.stock_count).to eq(n)
    expect(deck.cards.length).to eq(162 - 20)
  end

  it 'knows the current player with 2 players' do
    deck = Deck.full_deck
    player1 = Player.new
    player2 = Player.new
    n = 10
    g = Game.new([player1, player2], deck)
    g.deal_in(n)

    expect(g.current_player).to eq(player1)
    g.turn
    expect(g.current_player).to eq(player2)
    g.turn
    expect(g.current_player).to eq(player1)
    g.turn
    expect(g.current_player).to eq(player2)
  end

  it 'knows the current player with 3 players' do
    deck = Deck.full_deck
    player1 = Player.new
    player2 = Player.new
    player3 = Player.new
    n = 10
    g = Game.new([player1, player2, player3], deck)
    g.deal_in(n)

    expect(g.current_player).to eq(player1)
    g.turn
    expect(g.current_player).to eq(player2)
    g.turn
    expect(g.current_player).to eq(player3)
    g.turn
    expect(g.current_player).to eq(player1)
    g.turn
    expect(g.current_player).to eq(player2)
    g.turn
    expect(g.current_player).to eq(player3)
  end

  it 'gives the current player upto 5 cards' do
    deck = Deck.full_deck
    player1 = Player.new
    player2 = Player.new
    n = 10
    g = Game.new([player1, player2], deck)
    g.deal_in(n)

    expect(player1.hand.in_hand.count).to be < 5
    expect(player2.hand.in_hand.count).to be < 5
    g.turn
    expect(g.current_player.hand.in_hand.count).to eq(5)
  end
end

