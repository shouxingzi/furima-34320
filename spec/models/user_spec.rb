require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できるとき' do
      it 'nickname email encrypted_password password_confirmation first_name(漢字) last_name(漢字) first_name_kana last_name_kana birthdayがあれば登録できる' do
        expect(@user).to be_valid
      end
      it 'first_nameがひらがなで入力されていた場合でも登録できる' do
        @user.first_name = 'なまえ'
        expect(@user).to be_valid
      end
      it 'first_nameがカタカナで入力されていた場合でも登録できる' do
        @user.first_name = 'ナマエ'
        expect(@user).to be_valid
      end
      it 'last_nameがひらがなで入力されていた場合でも登録できる' do
        @user.last_name = 'なまえ'
        expect(@user).to be_valid
      end
      it 'last_nameがカタカナで入力されていた場合でも登録できる' do
        @user.last_name = 'ナマエ'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは＠を含まないと登録できない' do
        @user.email = 'test.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが６文字以上でないと登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英字だけでは登録できない' do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'pssswordは数字だけでは登録できない' do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordは全角では登録できない' do
        @user.password = 'ｔｅｓｕｔｏ１２'
        @user.password_confirmation = 'ｔｅｓｕｔｏ１２'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordとpassword_confirmationの値が一致していないと登録できない' do
        @user.password_confirmation = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameがアルファベットで入力されていると登録できない' do
        @user.first_name = 'name'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'first_nameが記号で入力されていると登録できない' do
        @user.first_name = '◯△□'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameがアルファベットで入力されていると登録できない' do
        @user.last_name = 'name'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'last_nameが記号で入力されていると登録できない' do
        @user.last_name = '◯△□'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'first_name_kanaがひらがなで入力されていると登録できない' do
        @user.first_name_kana = 'なまえ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'first_name_kanaが漢字で入力されていると登録できない' do
        @user.first_name_kana = '名前'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'first_name_kanaがアルファベットで入力されていると登録できない' do
        @user.first_name_kana = 'name'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'first_name_kanaが記号で入力されていると登録できない' do
        @user.first_name_kana = '◯△□'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'last_name_kanaがひらがなで入力されていると登録できない' do
        @user.last_name_kana = 'なまえ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'last_name_kanaが漢字で入力されていると登録できない' do
        @user.last_name_kana = '名前'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'last_name_kanaがアルファベットで入力されていると登録できない' do
        @user.last_name_kana = 'name'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'last_name_kanaが記号で入力されていると登録できない' do
        @user.last_name_kana = '◯△□'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
