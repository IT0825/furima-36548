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
    end

    context '新規出品できないとき' do
      it '画像の添付がないと出品できない' do
      end

      it '商品名の記入がないと出品できない' do
      end

      it '商品の説明の記入がないと出品できない' do
      end

      it 'カテゴリーの選択がないと出品できない' do
      end

      it '商品の状態の選択がないと出品できない' do
      end

      it '配送料の負担の選択がないと出品できない' do
      end

      it '発送元の地域の選択がないと出品できない' do
      end

      it '発送までの日数の選択がないと出品できない' do
      end

      it '価格の記入がないと出品できない' do
      end

      it '価格が299以下では出品できない' do
      end

      it '価格が10,000,000以上では出品できない' do
      end

      it '価格は全角数値だと出品できない' do
      end
    end
  end
end