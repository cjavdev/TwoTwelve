require 'rails_helper'

RSpec.describe Hand do
  it 'is dealt in with some cards' do
    h = Hand.deal_in([Card.new(1)])
    expect(h.stock_count).to eq(1)
    expect(h.stock_top).to eq(1)
    expect(h.discard_piles.length).to eq(4)
    expect(h.in_hand).to eq([])
  end
end
