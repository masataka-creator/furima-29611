class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates :nickname, presence: true
         validates :password, presence: true, length: { minimum: 6}, format: {with: /\A[a-zA-Z0-9]+\z/}
         # 漢字と全角の平仮名とカタカナのバリデーション
         validates :first_name, :last_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
         # 全角カタカナのバリデーション
         validates :first_name_kana, :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :birthdate, presence: true
        end

