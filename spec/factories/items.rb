FactoryBot.define do
  factory :item do
    name { Faker::Lorem.words }
    explanation { Faker::Lorem.sentence }
    price { Faker::Number.within(range: 300..9999999) }
    category_choice_id { Faker::Number.within(range: 2..11) }
    item_status_choice_id { Faker::Number.within(range: 2..6) }
    send_area_choice_id { Faker::Number.within(range: 2..48) }
    send_date_choice_id { Faker::Number.within(range: 2..4) }
    send_fee_choice_id { Faker::Number.within(range: 2..3) }

    association :user

  end

end
