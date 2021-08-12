class Hand
  attr_reader :discard_piles
  attr_reader :in_hand

  def self.deal_in(stock_pile)
    Hand.new(stock_pile, Array.new(4) { Array.new }, [])
  end

  def initialize(stock_pile=[], discard_piles=[], in_hand=[])
    @stock_pile = stock_pile
    @discard_piles = discard_piles
    @in_hand = in_hand
  end

  def in_hand_count
    in_hand.count
  end

  def stock_count
    @stock_pile.length
  end

  def stock_top
    @stock_pile.first
  end

  def draw(deck)
    cards = deck.deal(5 - in_hand_count)
    @in_hand += cards
  end
end
