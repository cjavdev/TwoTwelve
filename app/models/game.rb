class Game
  attr_reader :players, :deck

  def initialize(players, deck)
    @players = players
    @deck = deck
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

    # (maybe) play one card at a time
    # discard
  end
end
