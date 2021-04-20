require 'rails_helper'

RSpec.describe User, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_history_destination = FactoryBot.build(:purchase_history_destination, user_id: user.id, item_id: item.id)      
      sleep 0.1 #read_timeoutエラーを回避するための記述
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_history_destination).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @purchase_history_destination.building_name = ''
        expect(@purchase_history_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'user_idが空だと保存できない' do
        @purchase_history_destination.user_id = nil
        @purchase_history_destination.valid?
        expect(@purchase_history_destination.errors.full_messages).to include ("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @purchase_history_destination.item_id = nil
        @purchase_history_destination.valid?
        expect(@purchase_history_destination.errors.full_messages).to include ("Item can't be blank")
      end
      it 'priceが空だと保存できない' do
        @purchase_history_destination.price = nil
        @purchase_history_destination.valid?
        expect(@purchase_history_destination.errors.full_messages).to include ("Price can't be blank")
      end
      it 'tokenが空だと保存できない' do
        @purchase_history_destination.token = nil
        @purchase_history_destination.valid?
        expect(@purchase_history_destination.errors.full_messages).to include ("Token can't be blank")
      end
      it 'postcodeが空だと保存できない' do
        @purchase_history_destination.postcode = ''
        @purchase_history_destination.valid?
        expect(@purchase_history_destination.errors.full_messages).to include ("Postcode is invalid. Inclide hyphen(-)")
      end
      it 'postecodeは全角では保存できない' do
        @purchase_history_destination.postcode = '１２３−３４５６'
        @purchase_history_destination.valid?
        expect(@purchase_history_destination.errors.full_messages).to include ("Postcode is invalid. Inclide hyphen(-)")
      end
      it 'postecodeはハイフンがないと保存できない' do
        @purchase_history_destination.postcode = 1234567
        @purchase_history_destination.valid?
        expect(@purchase_history_destination.errors.full_messages).to include ("Postcode is invalid. Inclide hyphen(-)")
      end
      it 'prefecture_idが1だと保存できない' do
        @purchase_history_destination.prefecture_id = 1
        @purchase_history_destination.valid?
        expect(@purchase_history_destination.errors.full_messages).to include ("Prefecture must be other than 1")
      end
      it 'cityが空だと保存できない' do
        @purchase_history_destination.city = ''
        @purchase_history_destination.valid?
        expect(@purchase_history_destination.errors.full_messages).to include ("City can't be blank")
      end
      it 'addressが空だと保存できない' do
        @purchase_history_destination.address = ''
        @purchase_history_destination.valid?
        expect(@purchase_history_destination.errors.full_messages).to include ("Address can't be blank")
      end
      it 'phone_numberが空だと保存できない' do
        @purchase_history_destination.phone_number = ''
        @purchase_history_destination.valid?
        expect(@purchase_history_destination.errors.full_messages).to include ("Phone number can't be blank")
      end
      it 'phone_numberは全角では保存できない' do
        @purchase_history_destination.phone_number = '０２６８３８５５６６'
        @purchase_history_destination.valid?
        expect(@purchase_history_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberは11桁以上の数値になると保存できない' do
        @purchase_history_destination.phone_number = 123456789012
        @purchase_history_destination.valid?
        expect(@purchase_history_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it 'phone_numberは英数混合では保存できない' do
        @purchase_history_destination.phone_number = 'ab123456789'
        @purchase_history_destination.valid?
        expect(@purchase_history_destination.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
