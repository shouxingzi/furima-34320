require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '出品商品が登録できるとき' do
      it 'product_name, description, category_id, status_id, postage_id, prefecture_id, shipping_day_id, price, user_idがあれば登録できる' do
        expect(@item).to be_valid
      end
    end
  

    context '出品商品が登録できないとき' do
      it 'product_nameが空では登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end
      it 'descriptionが空では登録できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idの値が1だと登録できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is invalid")
      end
      it 'category_idの値が11を超えると登録できない' do
        @item.category_id = '12'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category is invalid")
      end
      it 'status_idが空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'status_idの値が1だと登録できない' do
        @item.status_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is invalid")
      end
      it 'status_idの値が7を超えると登録できない' do
        @item.status_id = '8'
        @item.valid?
        expect(@item.errors.full_messages).to include("Status is invalid")
      end
      it 'postage_idが空では登録できない' do
        @item.postage_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage can't be blank")
      end
      it 'postage_idの値が1だと登録できない' do
        @item.postage_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage is invalid")
      end
      it 'postage_idの値が3を超えると登録できない' do
        @item.postage_id = '4'
        @item.valid?
        expect(@item.errors.full_messages).to include("Postage is invalid")
      end
      it 'prefecture_idが空では登録できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idの値が1だと登録できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is invalid")
      end
      it 'prefecture_idの値が48を超えると登録できない' do
        @item.prefecture_id = '49'
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture is invalid")
      end
      it 'shipping_day_idが空では登録できない' do
        @item.shipping_day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'shipping_day_idの値が1だと登録できない' do
        @item.shipping_day_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day is invalid")
      end
      it 'shipping_day_idの値が4を超えると登録できない' do
        @item.shipping_day_id = '5'
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day is invalid")
      end
      it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceは全角数字だと登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceは300未満だと登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it 'priceは9,999,999を超えると登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end




    end

  end
end
