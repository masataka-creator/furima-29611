require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'ニックネームが空だと登録できない' do
      user = FactoryBot.build(:user)  # Userのインスタンス生成
      user.nickname = '' # nicknameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスが空だと登録できない' do
      user = FactoryBot.build(:user) # Userのインスタンス生成
      user.email = '' # emailの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it 'パスワードが空だと登録できない' do
      user = FactoryBot.build(:user) # passwordのインスタンス生成
      user.password = '' # passwordの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードと確認パスワードが一致していないと登録できない' do
      user = FactoryBot.build(:user) # Userのインスタンス生成
      user.password = 'aaaaaa' # password_confirmationの値をpasswordの値と違う値にする
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '性が空だと登録できない' do
      user = FactoryBot.build(:user) # Userのインスタンス生成
      user.first_name = '' # first_nameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it '名が空だと登録できない' do
      user = FactoryBot.build(:user) # Userのインスタンス生成
      user.last_name = '' # last_nameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end

    it '性カナが空だと登録できない' do
      user = FactoryBot.build(:user) # Userのインスタンス生成
      user.first_name_kana = '' # first_nameの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end

    it '名カナが空だと登録できない' do
      user = FactoryBot.build(:user) # Userのインスタンス生成
      user.last_name_kana = '' # last_name_kanaの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'パスワードが6文字未満だと登録できない' do
      user = FactoryBot.build(:user) # Userのインスタンス生成
      user.password = '' # passwordの値を6文字未満にする
      user.valid?
      expect(user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it '生年月日が空だと登録できない' do
      user = FactoryBot.build(:user) # Userのインスタンス生成
      user.birthdate = '' # birthdateの値を空にする
      user.valid?
      expect(user.errors.full_messages).to include("Birthdate can't be blank")
    end
  end

  describe '名前を半角で入力' do
    it '性を半角で入力した時登録できない' do
      user = FactoryBot.build(:user) # Userのインスタンス生成
      user.first_name_kana = 'ﾔﾏﾀﾞ' # first_name_kanaの値を半角にする
      user.valid?
      expect(user.errors.full_messages).to include('First name kana is invalid')
    end

    it '名を半角で入力した時登録できない' do
      user = FactoryBot.build(:user) # Userのインスタンス生成
      user.last_name_kana = 'ﾘｸﾀﾛｳ' # last_name_kanaの値を半角にする
      binding.pry
      expect(user.errors.full_messages).to include('Last name kana is invalid')
    end
  end

  describe 'フリガナをカタカナ意外で入力' do
    it '性カナをカタカナ意外で入力した時登録できない' do
      user = FactoryBot.build(:user) # Userのインスタンス生成
      user.first_name_kana = '' # first_name_kanaの値を全角片仮名以外にする
      user.valid?
      expect(user.errors.full_messages).to include('First name kana is invalid')
    end

    it '名カナをカタカナ意外で入力した時登録できない' do
      user = FactoryBot.build(:user) # Userのインスタンス生成
      user.last_name_kana = ''  # last_name_kanaの値を全角片仮名以外にする
      user.valid?
      expect(user.errors.full_messages).to include('Last name kana is invalid')
    end
  end
end
