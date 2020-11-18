class Item < ApplicationRecord
  has_one_attached :image
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :name
          validates :description
          validates :category_id
          validates :condition_id
          validates :delivery_charge_id
          validates :delivery_area_id
          validates :delivery_days_id
          validates :price
          validates :user
         end
end
