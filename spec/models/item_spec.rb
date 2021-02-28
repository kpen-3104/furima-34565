require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品情報をテーブルへ保存' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '商品情報をテーブルに保存できる時' do
      it '全ての値が正しく入力されていれば商品を保存できる' do
        expect(@item).to be_valid
      end
    end
    context '商品が出品できない時' do
      it '商品画像がつけられていなければ保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が空では保存できない' do
        @item.item_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it '商品名が40字を超えた場合は保存できない' do
        @item.item_name = Faker::Name.initials(number: 41)
        @item.valid?
        expect(@item.errors.full_messages).to include('Item name is too long (maximum is 40 characters)')
      end

      it '商品の説明が空では保存できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item description can't be blank")
      end
      it '商品の説明が7字を下回った場合は保存できない' do
        @item.item_description = Faker::Name.initials(number: 6)
        @item.valid?
        expect(@item.errors.full_messages).to include('Item description is too short (minimum is 7 characters)')
      end
      it '商品の説明が1,000字を超えた場合は保存できない' do
        @item.item_description = Faker::Name.initials(number: 1001)
        @item.valid?
        expect(@item.errors.full_messages).to include('Item description is too long (maximum is 1000 characters)')
      end
      it 'カテゴリーの情報が空では保存できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it '商品の状態についての情報が空では保存できない' do
        @item.item_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item condition must be other than 1')
      end
      it '配送料の負担についての情報が空では保存できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end
      it '発送元の地域についての情報が空では保存できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping area must be other than 1')
      end
      it '発送までの日数についての情報が空では保存できない' do
        @item.day_to_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day to ship must be other than 1')
      end
      it '販売価格についての情報が空では保存できない' do
        @item.item_price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Item price can't be blank")
      end
      it '販売価格は、￥300を下回れば保存できない' do
        @item.item_price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be greater than or equal to 300')
      end
      it '販売価格は、￥9,999,999を上回れば保存できない' do
        @item.item_price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price must be less than or equal to 9999999')
      end
      it '販売価格は半角数字でなければ保存できない' do
        @item.item_price = '数字'
        @item.valid?
        expect(@item.errors.full_messages).to include('Item price is not a number')
      end
    end
  end
end
