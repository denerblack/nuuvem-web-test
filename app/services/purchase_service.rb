class PurchaseService

  def upload(file)
    hash = ProcessData.convert(file)
    purchases = hash.map do |h|
      purchaser = Purchaser.find_or_create_by(name: h['purchaser_name'])
      item = Item.find_or_create_by(description: h['item_description'], price: h['item_price'])
      merchant = Merchant.find_or_create_by(name: h['merchant_name'], address: h['merchant_address'])
      Purchase.create(purchaser: purchaser, item: item, merchant: merchant, amount: h['purchase_count'])
    end
  end

end
