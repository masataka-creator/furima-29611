class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to  :category
  belongs_to  :condition
  belongs_to  :delivery_charge
  belongs_to  :delivery_area
  belongs_to  :delivery_day
  has_one_attached :item_images

  

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
    validates :user_id
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :delivery_area_id
    validates :delivery_days_id
  end
end
