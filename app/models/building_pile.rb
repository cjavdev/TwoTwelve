class BuildingPile
  def initialize(cards=[])
    @cards = cards
  end

  def add_card(card)
    @cards << card
  end

  def move(from_pile, card)
    if valid?(card)
      # remove from the from pile
      from_pile.remove(card)

      # add it to @cards
      add_card(card)
    else
      throw ArgumentError.new("Cannot move #{card.value} onto #{inspect}")
    end
  end

  def valid?(card)
    return true if card.value == :wild
    return true if top_card.nil? && card.value == 1
    return true if @cards.length + 1 == card.value
    false
  end

  def top_card
    @cards.last
  end
end
