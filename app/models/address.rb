class Address < ApplicationRecord
  belongs_to :user
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  with_options presence: true do
    validates :phone_num, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :home_number
    validates :telephone, format: { with: /\A[0-9]+\z/ }, length: { maximum: 11 }
  end
end
