FactoryBot.define do
  factory :item do
    product_name           { 'テスト' }
    description_of_item    { 'テスト' }
    category_id            { 1 }
    product_condition_id   { 1 }
    shipping_fee_burden_id { 1 }
    prefecture_id          { 1 }
    day_to_ship_id         { 1 }
    price                  { 300 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end