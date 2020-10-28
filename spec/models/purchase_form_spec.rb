require 'rails_helper'

RSpec.describe PurchaseForm, type: :model do
  before do
    @purchase_form = FactoryBot.build(:purchase_form)
  end

  describe '購入機能登録' do
    context '新規登録がうまくいくとき' do
      it '全ての値がデータに入っている時' do
        expect(@purchase_form).to be_valid
      end
      it 'buildingは空でも購入できる' do
        @purchase_form.building_name = nil
        expect(@purchase_form).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'トークンが空だと購入できない' do
        @purchase_form.token = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空だと購入できない' do
        @purchase_form.post_code = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Post code can't be blank", 'Post code is invalid')
      end
      it '郵便番号の桁数が違うと購入できない' do
        @purchase_form.post_code = '111-000000'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Post code is invalid')
      end
      it '郵便番号にハイフンがないと購入できない' do
        @purchase_form.post_code = '111000000'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Post code is invalid')
      end
      it 'cityが空だと登録できない' do
        @purchase_form.city = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numが空だと購入できない' do
        @purchase_form.house_num = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("House num can't be blank")
      end
      it 'prefecture_idが"--"だと購入できない' do
        @purchase_form.prefecture_id = 0
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Prefecture must be other than 0')
      end
      it 'phone_numが空だと購入できない' do
        @purchase_form.phone_num = nil
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone num can't be blank", 'Phone num is invalid')
      end
      it 'phone_numにハイフンが含まれていると購入できない' do
        @purchase_form.phone_num = '090-7415-0967'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include('Phone num is invalid')
      end
      it 'phone_numが11桁より多いと購入できない' do
        @purchase_form.phone_num = '090111111111'
        @purchase_form.valid?
        expect(@purchase_form.errors.full_messages).to include("Phone num is too long (maximum is 11 characters)")

      end
    end
  end
end
