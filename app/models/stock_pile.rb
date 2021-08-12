class StockPile
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def remove(card)
    if card != top_card
      raise ArgumentError.new("Can only remove the top card, tried to remove #{card.value}")
    else
      @cards.pop
    end
  end

  def top_card
    @cards.last
  end
end
