require 'rails_helper'

RSpec.describe ProcessData, type: :lib do
  let(:data) do
    [
      {
        "purchaser_name"=>"João Silva",
        "item_description"=>"R$10 off R$20 of food",
        "item_price"=>"10.0",
        "purchase_count"=>"2",
        "merchant_address"=>"987 Fake St",
        "merchant_name"=>"Bob's Pizza"
      },
      {
        "purchaser_name"=>"Amy Pond",
        "item_description"=>"R$30 of awesome for R$10",
        "item_price"=>"10.0",
        "purchase_count"=>"5",
        "merchant_address"=>"456 Unreal Rd",
        "merchant_name"=>"Tom's Awesome Shop"
      },
      {
        "purchaser_name"=>"Marty McFly",
        "item_description"=>"R$20 Sneakers for R$5",
        "item_price"=>"5.0",
        "purchase_count"=>"1",
        "merchant_address"=>"123 Fake St",
        "merchant_name"=>"Sneaker Store Emporium"
      },
      {
        "purchaser_name"=>"Snake Plissken",
        "item_description"=>"R$20 Sneakers for R$5",
        "item_price"=>"5.0",
        "purchase_count"=>"4",
        "merchant_address"=>"123 Fake St",
        "merchant_name"=>"Sneaker Store Emporium"
      }
    ]
  end

  describe "Convert File" do
    it 'returns file content as array of hashes' do
      file = Rack::Test::UploadedFile.new("#{Rails.root}/spec/example_input.tab", "file/csv")
      result = ProcessData.convert(file)
      expect(result).to eq(data)
    end

    it 'returns empty file file is null' do
      result = ProcessData.convert(nil)
      expect(result).to eq([])
    end
  end
end
