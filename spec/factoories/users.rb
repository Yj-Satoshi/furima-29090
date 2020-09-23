FactoryBot.define do
    factory :user do
        nickname {Faker::Name.initials(number: 2)}
        email {Faker::Internet.free_email}
        password = Faker::Internet.password(mini_length: 6)
        password {password}
        password_comfirmation {password}
        birth_day {Faker::Date.in_date_period}
        family_name_kanji {"山田"}
        first_name_kanji {"陸郎"}
        family_name_kana {"ヤマダ"}
        first_name_kana {"リクロウ"}
    end
end