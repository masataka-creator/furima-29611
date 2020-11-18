class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :nickname
          validates :birthdate
          validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{6,}\z/i}
         end

          with_options presence: true, format: {with: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/} do
            validates :first_name
            validates :last_name
          end
        
          with_options presence: true, format: {with: /\A[ァ-ヶー－]+\z/} do
            validates :first_name_kana
            validates :last_name_kana
          end
        end        