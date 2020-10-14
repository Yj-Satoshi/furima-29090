FactoryBot.define do
  factory :purchase_address do
    postal_code { "111-1111" }
    send_area_choice_id { Faker::Number.within(range: 2..48) }
    municipalities { Faker::Lorem.words }
    address { Faker::Lorem.words }
    building { Faker::Lorem.words }
    phone_number { Faker::Number.within(range: 0..9999999) }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
