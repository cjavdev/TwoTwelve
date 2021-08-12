class Game
  attr_reader :players, :deck, :building_piles

  def initialize(players, deck, building_piles=[])
    @players = players
    @deck = deck
    @building_piles = building_piles
    @current_player_index = 0
  end

  def deal_in(num_stock_cards)
    players.each do |player|
      stock_cards = deck.deal(num_stock_cards)
      player.hand = Hand.deal_in(stock_cards)
    end
  end

  def current_player
    players[@current_player_index]
  end

  def turn
    @current_player_index = (@current_player_index + 1) % players.count
    # deal enough cards until current player's hand is 5
    current_player.hand.draw(deck)

    # (maybe) play one card at a time
    card_to_play = current_player.pick_card
    # pile_to_play_on = current_player.pick_pile

    # discard
  end
end
