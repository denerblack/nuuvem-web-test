require 'csv'

class InvoicesController < ApplicationController
  def index
  end

  def upload
    #csv = CSV.read(params[:attachment].tempfile, col_sep: "\t", headers: :first_row)
    #hash = csv.map(&:to_h)
    #hash = hash.map { |h| h.transform_keys! {|key| key.gsub(/\ /, '_') } }
	hash = ProcessData.convert(params[:attachment])
    purchases = hash.map do |h|
      purchaser = Purchaser.find_or_create_by(name: h['purchaser_name'])
	  item = Item.find_or_create_by(description: h['item_description'], price: h['item_price'])
	  merchant = Merchant.find_or_create_by(name: h['merchant_name'], address: h['merchant_address'])
	  Purchase.create(purchaser: purchaser, item: item, merchant: merchant, amount: h['purchase_count'])
    end
    debugger
    render json: purchases.to_json
  end
end
