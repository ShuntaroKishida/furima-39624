require 'rails_helper'

RSpec.describe PaymentsShippings, type: :model do
  describe '購入情報の保存' do
    
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item, user_id: user.id)
      @payment_shipping = FactoryBot.build(:payments_shippings, user_id: user.id, item_id: item.id)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@payment_shipping).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @payment_shipping.building = ''
        expect(@payment_shipping).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postalが空だと保存できないこと' do
        @payment_shipping.postal = ''
        @payment_shipping.valid?
        expect(@payment_shipping.errors.full_messages).to include("Postal can't be blank")
      end
      it 'postalが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @payment_shipping.postal = '1234567'
        @payment_shipping.valid?
        expect(@payment_shipping.errors.full_messages).to include('Postal is invalid. Include hyphen(-)')
      end
      it 'prefecture_idを選択していないと保存できないこと' do
        @payment_shipping.prefecture_id = 1
        @payment_shipping.valid?
        expect(@payment_shipping.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @payment_shipping.city = ''
        @payment_shipping.valid?
        expect(@payment_shipping.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @payment_shipping.address = ''
        @payment_shipping.valid?
        expect(@payment_shipping.errors.full_messages).to include("Address can't be blank")
      end
      it 'phoneが空だと保存できないこと' do
        @payment_shipping.phone = ''
        @payment_shipping.valid?
        expect(@payment_shipping.errors.full_messages).to include("Phone can't be blank")
      end
      it 'phoneが9桁以下では保存できないこと' do
        @payment_shipping.phone = '09012345'
        @payment_shipping.valid?
        expect(@payment_shipping.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneが12桁以上では保存できないこと' do
        @payment_shipping.phone = '090123456789'
        @payment_shipping.valid?
        expect(@payment_shipping.errors.full_messages).to include("Phone is invalid")
      end
      it 'phoneに半角数字以外が含まれている場合は保存できないこと' do
        @payment_shipping.phone = '090-1234567'
        @payment_shipping.valid?
        expect(@payment_shipping.errors.full_messages).to include("Phone is invalid")
      end
      it "tokenが空では登録できないこと" do
        @payment_shipping.token = nil
        @payment_shipping.valid?
        expect(@payment_shipping.errors.full_messages).to include("Token can't be blank")
      end
      it "userが紐付いていなければ購入できない" do
        @payment_shipping.user_id = nil
        @payment_shipping.valid?
        expect(@payment_shipping.errors.full_messages).to include("User can't be blank")
      end
      it "itemが紐付いていなければ購入できない" do
        @payment_shipping.item_id = nil
        @payment_shipping.valid?
        expect(@payment_shipping.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end

#bundle exec rspec spec/models/payments_shippings_spec.rb