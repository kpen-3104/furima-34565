require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報をテーブルへ保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
      sleep(0.1)
    end
    context '購入情報をテーブルに保存できる時' do
      it 'tokenと配送先情報が正しく入力されていれば購入情報を保存できる' do
        expect(@order_address).to be_valid
      end
      it '建物名が未入力でも購入情報を保存できる' do
        @order_address.building_name = ""
        expect(@order_address).to be_valid
      end
      
    end
    context '購入情報をテーブルに保存できない時' do
      it '郵便番号が空では保存できない' do
        @order_address.postal_code = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号はでハイフンがなければ保存できない' do
        @order_address.postal_code = 3112222
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid")
      end
      it '都道府県が空では保存できない' do
        @order_address.shipping_area_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Shipping area must be other than 1")
      end
      it '市町村が空では保存できない' do
        @order_address.city = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空では保存できない' do
        @order_address.house_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("House number can't be blank")
      end
      it '電話番号が空では保存できない' do
        @order_address.phone_number = ""
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が半角数字でなければ保存できない' do
        @order_address.phone_number = "090ddddffff"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が11桁を超えた場合保存できない' do
        @order_address.phone_number = "090111122223"
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
      end
      it 'tokenが空では保存できない' do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
