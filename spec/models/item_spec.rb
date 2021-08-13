require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能' do
    context '新規出品できるとき' do
      it '必要情報を適切に入力すると保存される' do
        expect(@item).to be_valid
      end

      it '価格は300以上から出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end

      it '価格は9,999,999以下まで出品できる' do
        @item.price = 9999999
        expect(@item).to be_valid
      end
    end

    context '新規出品できないとき' do
      it '画像の添付がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名の記入がないと出品できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it '商品の説明の記入がないと出品できない' do
        @item.description_of_item = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description of item can't be blank")
      end

      it 'カテゴリーの選択がないと出品できない' do
        @item.category_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態の選択がないと出品できない' do
        @item.product_condition_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end

      it '配送料の負担の選択がないと出品できない' do
        @item.shipping_fee_burden_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden can't be blank")
      end

      it '発送元の地域の選択がないと出品できない' do
        @item.prefecture_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '発送までの日数の選択がないと出品できない' do
        @item.day_to_ship_id = 0
        @item.valid?
        expect(@item.errors.full_messages).to include("Day to ship can't be blank")
      end

      it '価格の記入がないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank", 'Price is not a number')
      end

      it '価格が299以下では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '価格が10,000,000以上では出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '価格は全角数値だと出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'userが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
