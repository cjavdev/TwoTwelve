class Player
  attr_accessor :hand

  def pick_card
    puts "Pick a card."
    puts "In your hand you have: #{in_hand_values}"
    puts "In your discard piles you have: #{discard_values}"
    puts "Do you want to pick from stock (S), hand (H), or discard pile (D):"
    choice = gets.chomp
    if choice.upcase == "S"
      return hand.stock_top, hand.stock_pile
    end

    puts "Which card do you want to pick?"
    card_index_choice = gets.chomp.to_i
    chosen_card = nil

    if choice.upcase == "H"
      chosen_card = hand.in_hand[card_index_choice]
      return chosen_card, hand.in_hand
    elsif choice.upcase == "D"
      pile = hand.discard_piles[card_index_choice]
      chosen_card = pile.top_card
      return chosen_card, pile
    end

    chosen_card
  end

  def pick_pile(building_piles)
    puts "Do you want to build (B) or discard (D)"
    choice = gets.chomp
    if choice.upcase == "B"
      puts "Pick a pile to build on"
      pile_choice = gets.chomp.to_i
      return building_piles[pile_choice]
    elsif choice.upcase == "D"
      puts "Pick a pile do discard to"
      pile_choice = gets.chomp.to_i
      return hand.discard_piles[pile_choice]
    end
  end

  def in_hand_values
    hand.in_hand.values
  end

  def discard_values
    hand
      .discard_piles
      .map(&:top_card)
      .map {|top_card| top_card.try(:value)}
  end
end
