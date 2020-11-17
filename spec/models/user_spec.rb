require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end


  describe 'ユーザー新規登録' do
    it 'ニックネームが空だと登録できない' do
      @user.nickname = '' # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスが空だと登録できない' do
      @user.email = '' # emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'メールアドレスは、@を含む必要があること' do
      @user.email = 'aaaaaa' # emailの値を@を含まない値にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'パスワードが空だと登録できない' do
      @user.password = '' # passwordの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードと確認パスワードが一致していないと登録できない' do
      @user.password_confirmation = 'aaa111' # password_confirmationの値をpasswordの値と違う値にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'パスワードは、半角英数字混合での入力が必須であること' do
      @user.password = 'aaaaaa' # passwordの値を半角英字で統一してみる
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'パスワードが6文字未満だと登録できない' do
      @user.password = 'a1234' # passwordの値を6文字未満にする
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it '性が空だと登録できない' do
      @user.first_name = '' # first_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it '名が空だと登録できない' do
      @user.last_name = '' # last_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it '性カナが空だと登録できない' do
      @user.first_name_kana = '' # first_nameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it '名カナが空だと登録できない' do
      @user.last_name_kana = '' # last_name_kanaの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it '生年月日が空だと登録できない' do
      @user.birthdate = '' # birthdateの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthdate can't be blank")
    end
  end

  describe '名前を半角で入力' do
    it '性を半角で入力した時登録できない' do
      @user.first_name_kana = 'ﾔﾏﾀﾞ' # first_name_kanaの値を半角にする
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it '名を半角で入力した時登録できない' do
      @user.last_name_kana = 'ﾘｸﾀﾛｳ' # last_name_kanaの値を半角にする
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
  end

  describe 'フリガナをカタカナ意外で入力' do
    it '性カナをカタカナ意外で入力した時登録できない' do
      @user.first_name_kana = 'やまだ' # first_name_kanaの値を全角片仮名以外にする
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it '名カナをカタカナ意外で入力した時登録できない' do
      @user.last_name_kana = 'りくたろう'  # last_name_kanaの値を全角片仮名以外にする
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end
  end
end
