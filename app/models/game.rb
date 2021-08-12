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
    card_to_play, from_pile = current_player.pick_card

    # pick a pile where we're placing the card
    to_pile = current_player.pick_pile(building_piles)

    to_pile.move(from_pile, card_to_play)

    # # Confirm not discarding from discard or stock pile
    # if (from_pile.is_a?(DiscardPile) || from_pile.is_a?(StockPile)) && to_pile.is_a?(DiscardPile)
    #   raise ArgumentError.new("Unable to discard from discard or stock pile.")
    # end
    #
    # # TODO: confirm valid discard
    # if to_pile.is_a?(DiscardPile)
    #   # move
    # end
    #
    # # TODO: confirm valid move
    # if to_pile.is_a?(BuildingPile)
    #
    # end
    #
    # # TODO: If valid, pick again
  end
end
