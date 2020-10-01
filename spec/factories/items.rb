FactoryBot.define do
  factory :item do
    name { Faker::Lorem.words }
    item_status_id { Faker::Number.digit }
    explanation { Faker::Lorem.sentence }
    price { Faker::Number.within(range: 300..9999999) }
    category_id { Faker::Number.digit }
    send_area_id { Faker::Number.digit }
    send_date_id { Faker::Number.digit }
    send_fee_id { Faker::Number.digit }

    association :user

  end

end
