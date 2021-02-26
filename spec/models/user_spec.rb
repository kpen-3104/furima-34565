require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    context '新規登録できる時' do
      it '全ての値が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに＠が含まれていれば登録できる' do
        @user.email = 'test@test'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上で、半角英数字混合であれば登録できる' do
        @user.password = '1k1k1k'
        @user.password_confirmation = '1k1k1k'
        expect(@user).to be_valid
      end
      it 'last_nameは、全角（漢字・平仮名・カタカナ）での入力であれば登録できる' do
        @user.last_name = '漢字ひらがなカタカナ'
        expect(@user).to be_valid
      end
      it 'first_nameは、全角（漢字・平仮名・カタカナ）での入力であれば登録できる' do
        @user.first_name = '漢字ひらがなカタカナ'
        expect(@user).to be_valid
      end
      it 'last_name_readingまたはfirst_name_readingは、全角（カタカナ）での入力であれば登録できる' do
        @user.last_name = 'カタカナ'
        @user.first_name = 'カタカナ'
        expect(@user).to be_valid
      end
    end

    context '新規登録できない時' do
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
      it 'emailが一意でなければ登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに、@が含まれなければ登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが、５文字以下では登録できない' do
        @user.password = '1k1k1'
        @user.password_confirmation = '1k1k1'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが、半角英数字混合でなければ登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが、英字のみでは登録できない' do
        @user.password = 'kkkkkk'
        @user.password_confirmation = 'kkkkkk'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが、全角文字では登録できない' do
        @user.password = '１ｋ１ｋ１ｋ'
        @user.password_confirmation = '１ｋ１ｋ１ｋ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordとpassword_confirmationは、値が一致しなければ登録できない' do
        @user.password = '1k1k1k'
        @user.password_confirmation = '0k0k0k'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameは、全角（漢字・平仮名・カタカナ）での入力でなければ登録できない' do
        @user.last_name = 'kk'
        @user.valid?
        expect(@user.errors.full_messages).to include(
          'Last name is invalid. Input full-width characters.'
        )
      end
      it 'last_name_readingは空では登録できない' do
        @user.last_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading can't be blank")
      end
      it 'last_name_readingは全角（カタカナ）での入力でなければ登録できない' do
        @user.last_name_reading = 'kk'
        @user.valid?
        expect(@user.errors.full_messages).to include(
          'Last name reading is invalid. Input full-width katakana characters.'
        )
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameは、全角（漢字・平仮名・カタカナ）での入力でなければ登録できない' do
        @user.first_name = 'oo'
        @user.valid?
        expect(@user.errors.full_messages).to include(
          'First name is invalid. Input full-width characters.'
        )
      end
      it 'first_name_readingが空では登録できない' do
        @user.first_name_reading = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading can't be blank")
      end
      it 'first_name_readingは全角（カタカナ）での入力でなければ登録できない' do
        @user.first_name_reading = 'oo'
        @user.valid?
        expect(@user.errors.full_messages).to include(
          'First name reading is invalid. Input full-width katakana characters.'
        )
      end
      it '生年月日が空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
