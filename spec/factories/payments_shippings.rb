FactoryBot.define do
  factory :payments_shippings do
    postal        { '123-4567' }
    prefecture_id { 2 }
    city          { '横浜' }
    address       { '1-1' }
    building      { 'ビル' }
    phone         { '09012345678' }
    token         { 'tok_abcdefghijk00000000000000000' }
  end
end
