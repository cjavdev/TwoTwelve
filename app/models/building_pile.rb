class BuildingPile
  def initialize(cards=[])
    @cards = cards
  end

  def top_card
    @cards.last
  end
end
