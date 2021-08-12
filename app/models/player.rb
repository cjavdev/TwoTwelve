class Player
  attr_accessor :hand

  def pick_card
    puts "Pick a card."
    puts "In your hand you have: #{in_hand_values}"
    puts "In your discard piles you have: #{discard_values}"
    puts "Do you want to pick from stock (S), hand (H), or discard pile (D):"
    choice = gets.chomp
    if choice.upcase == "S"
      return hand.stock_top
    end

    puts "Which card do you want to pick?"
    card_index_choice = gets.chomp.to_i
    chosen_card = nil

    if choice.upcase == "H"
      chosen_card = hand.in_hand[card_index_choice]
    elsif choice.upcase == "D"
      chosen_card = hand.discard_piles[card_index_choice].last
    end

    chosen_card
  end

  def in_hand_values
    hand.in_hand.map(&:value)
  end

  def discard_values
    hand
      .discard_piles
      .map(&:last)
      .map {|top_card| top_card.try(:value)}
  end
end
