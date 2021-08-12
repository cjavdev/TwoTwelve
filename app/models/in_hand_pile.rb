class InHandPile
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def remove(card)
    if !cards.include?(card)
      raise ArgumentError.new("Cannot remove a card thats not in hand #{card.value}")
    end
    cards.reject! {|c| c == card}
  end

  def values
    cards.map(&:value)
  end

  def [](idx)
    cards[idx]
  end
end
