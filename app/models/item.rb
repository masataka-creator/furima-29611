class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to       :category
  belongs_to       :condition
  belongs_to       :delivery_charge
  belongs_to       :delivery_area
  belongs_to       :delivery_day
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :delivery_area_id
    validates :delivery_days_id
    validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than: 299, less_than: 10_000_000 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :delivery_charge_id
    validates :delivery_area_id
    validates :delivery_days_id
  end
end
