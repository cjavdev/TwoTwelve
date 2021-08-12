class Deck
  attr_reader :cards

  def self.full_deck
    cards = []
    12.times do
      (1..12).each do |value|
        cards << Card.new(value)
      end
    end
    18.times do
      cards << WildCard.new
    end

    Deck.new(cards)
  end

  def initialize(cards=[])
    @cards = cards
  end

  def shuffle!
    @cards.shuffle!
  end

  def deal(n)
    @cards.pop(n)
  end
end
