class CreateItems < ActiveRecord::Migration[6.0]
  def change
    change_table :items do |t|
      t.string     :name, null: false
      t.text       :description, null: false
      t.integer    :category_id, null: false
      t.integer    :condition_id, null: false
      t.integer    :delivery_charge_id, null:false
      t.integer    :delivery_area_id, null: false
      t.integer    :delivery_days_id, null: false
      t.integer    :price, null: false
      t.references :user_id, null: false
      t.timestamps
    end
  end
end
