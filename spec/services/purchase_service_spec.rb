require 'rails_helper'

RSpec.describe PurchaseService, type: :service do

  it 'returns purchases from a file upload' do
    file = Rack::Test::UploadedFile.new("#{Rails.root}/spec/example_input.tab", "file/csv")
    purchase_service = PurchaseService.new
    purchases = purchase_service.upload(file)
    expect(purchases.size).to eq(4)
  end
end
