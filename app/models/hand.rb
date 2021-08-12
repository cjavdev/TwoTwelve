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

  def stock_count
    @stock_pile.length
  end

  def stock_top
    @stock_pile.first.value
  end
end
