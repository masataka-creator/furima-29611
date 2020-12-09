class UserOrder
  include ActiveModel::Model
  attr_accessor :phone_num, :prefecture_id, :city, :home_number, :building_name, :telephone, :user_id, :item_id, :price, :token

  with_options presence: true do
    validates :phone_num, format: {with: /\A\d{3}[-]\d{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :home_number
    validates :telephone, format: { with: /\A[0-9]+\z/ }, length: { maximum: 11 }
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    Address.create(phone_num: phone_num, prefecture_id: prefecture_id, city: city, home_number: home_number, building_name: building_name, telephone: telephone)
    order = Order.create(user_id: user_id, item_id: item_id)
  end
end