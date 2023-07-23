FactoryBot.define do

  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    birth_date            {Faker::Date.birthday}
    last_name             {"山田"}
    first_name            {"陸太郎"}
    last_name_kana        {"ヤマダ"}
    first_name_kana       {"リクタロウ"}
  end

end