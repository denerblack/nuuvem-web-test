class Purchase < ApplicationRecord
  belongs_to :purchaser
  belongs_to :item
  belongs_to :merchant

  def total
	  amount.to_i * item.price.to_f
  end

  def as_json

  end
end
