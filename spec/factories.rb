FactoryBot.define do

  factory :purchaser do
    name { "Dunha" }
  end

  factory :merchant do
    name {"Name"}
    address {"Address"}
  end

  factory :item, class: Item do
    description {"description"}
    price {10.0}
  end

  factory :purchase do
    purchaser
    item
    merchant
    amount {10.0}
  end

end
