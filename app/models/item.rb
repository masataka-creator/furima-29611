class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category_id
  belongs_to :condition_id
  belongs_to :delivery_charge_id
  belongs_to :delivery_area_id
  belongs_to :delivery_days_id

  has_one_attached :item_images
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true do
          validates :item_images
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

         with_options numericality: { other_than: 1 } do
          validates :category_id
          validates :condition_id
          validates :delivery_charge_id
          validates :delivery_area_id
          validates :delivery_days_id
         end
end
