require 'rails_helper'

RSpec.describe Purchase, type: :model do
  it 'returns total' do
    purchase = create(:purchase)
    expect(purchase.total).to eq(100.0)
  end
end
