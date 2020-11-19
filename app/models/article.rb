class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_day

  validates :category_id, numericality: { other_than: 1 }
  validates :condition_id, numericality: { other_than: 1 } 
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :delivery_area_id, numericality: { other_than: 1 }
  validates :delivery_day_id, numericality: { other_than: 1 } 
end
