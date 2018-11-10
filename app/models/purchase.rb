class Purchase < ApplicationRecord
  belongs_to :purchaser
  belongs_to :item
  belongs_to :merchant

  delegate :name, to: :purchaser, prefix: true
  delegate :name, to: :merchant, prefix: true
  delegate :address, to: :merchant, prefix: true
  delegate :description, to: :item, prefix: true
  delegate :price, to: :item, prefix: true

  def total
	  amount.to_i * item.price.to_f
  end
end
