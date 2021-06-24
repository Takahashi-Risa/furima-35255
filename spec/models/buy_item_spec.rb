require 'rails_helper'

RSpec.describe BuyItem, type: :model do
  describe '商品の購入' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @buy_item = FactoryBot.build(:buy_item, user_id: @user.id, item_id: @item.id)
    end
    context '商品の購入記録ができるとき' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@buy_item).to be_valid
      end
      it 'buildingが空でも保存できる' do
        @buy_item.building = ''
        expect(@buy_item).to be_valid
      end
    end
    context '商品の購入記録ができない時' do
      it 'userが紐づいていないと保存できない' do
        @buy_item.user_id = nil
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていないと保存できない' do
        @buy_item.item_id = nil
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenがからの時保存できない' do
        @buy_item.token = nil
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeがからの時保存できない' do
        @buy_item.postal_code = ''
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと保存できない' do
        @buy_item.postal_code = '1234567'
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include('Postal code Input correctly')
      end
      it '都道府県を選択しないと保存できない' do
        @buy_item.prefecture_id = nil
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include('Prefecture Select')
      end
      it '都道府県に「--」が選択されている場合は登録できない' do
        @buy_item.prefecture_id = '1'
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include('Prefecture Select')
      end
      it '市町村の入力がないと保存できない' do
        @buy_item.city = ''
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("City can't be blank")
      end
      it '電話番号が空だと保存できない' do
        @buy_item.phone_number = ''
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号に数値以外があると保存できない' do
        @buy_item.phone_number = '090-1234-5678'
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include('Phone number Input only number')
      end
      it '電話番号に英字が混ざっても保存できない' do
        @buy_item.phone_number = 'phone090123'
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include('Phone number Input only number')
      end
      it '電話番号が11桁を超えると保存できない' do
        @buy_item.phone_number = '090123456789'
        @buy_item.valid?
        expect(@buy_item.errors.full_messages).to include("Phone number Input only number")
      end
    end
  end
end