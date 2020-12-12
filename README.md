# テーブル設計

## users テーブル

| Column             | Type    | Options                 |
| ------------------ | ------- | ----------------------- |
| nickname           | string  | null: false             |
| email              | string  | null: false,unique:true |
| encrypted_password | string  | null: false             |
| first_name         | string  | null: false             |
| last_name          | string  | null: false             |
| first_name_kana    | string  | null: false             |
| last_name_kana     | string  | null: false             |
| birthdate          | date    | null: false             |

### Association

- has_many :items
- has_many :user_orders
- has_many :addresses


## items テーブル

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| name               | string     | null: false                  |
| description        | text       | null: false                  | 
| category_id        | integer    | null: false                  |
| condition_id       | integer    | null: false                  |
| delivery_charge_id | integer    | null: false                  |
| delivery_area_id   | integer    | null: false                  |
| delivery_day_id    | integer    | null: false                  |
| price              | integer    | null: false                  |
| user               | references | foreign_key:true             |

### Association

- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_charge
- belongs_to_active_hash :delivery_area
- belongs_to_active_hash :delivery_day
- belongs_to :user
- has_one :user_order


## user_orders テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| user       | references | foreign_key: true |
| item       | references | foreign_key: true |


### Association

- has_one :address
- belongs_to :item
- belongs_to :user

## addresses テーブル

| Column           | Type       | Options             |
| ---------------- | ---------- | ------------------- |
| phone_num        | string     | null: false         |
| prefecture_id    | integer    | null: false         |
| city             | string     | null: false         |
| home_number      | string     | null: false         |
| building_name    | string     |                     |
| telephone        | string     | null: false         |
| user_order       | references | foreign_key:true    |

### Association

- belongs_to_active_hash:prefecture
- belongs_to :user_order
- belongs_to :user
