FactoryBot.define do

  factory :item do
    name            {"サンプル"}
    price           {"10000"}
    explain         {"サンプルサンプル"}
    category_id     {"2"}
    condition_id    {"2"}
    charge_id       {"2"}
    prefecture_id   {"2"}
    criterion_id    {"2"}
    association     :user

    after(:build) do |item|
      item.images.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end

end
