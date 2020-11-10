# テーブル設計

## users テーブル

| Column             | Type    | Options                 |
| ------------------ | ------- | ----------------------- |
| nickname           | string  | null: false             |
| email              | string  | null: false,unique:true |
| password           | string  | null: false             |
| encrypted_password | string  | null: false             |
| first_name         | string  | null: false             |
| last_name          | string  | null: false             |
| first_name_kana    | string  | null: false             |
| last_name_kana     | string  | null: false             |
| birthdate          | date    | null: false             |

### Association

- has_many :items
- belongs_to :purchase_history


## items テーブル

| Column             | Type       | Options                      |
| ------------------ | ---------- | ---------------------------- |
| name               | string     | null: false                  |
| description        | text       | null: false                  | 
| category_id        | integer    | null: false                  |
| condition_id       | integer    | null: false                  |
| delivery_charge_id | integer    | null: false                  |
| delivery_area_id   | integer    | null: false                  |
| delivery_days_id   | integer    | null: false                  |
| price              | integer    | null: false                  |
| user               | references | foreign_key:true             |

### Association

- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :delivery_charge
- belongs_to_active_hash :delivery_area
- belongs_to_active_hash :delivery_days
- belongs_to :user


## purchase_histories テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| user       | references | foreign_key: true |
| item       | references | foreign_key:true  |


### Association

- has_one :address
- belongs_to :item
- belongs_to :user

## address テーブル

| Column           | Type       | Options             |
| ---------------- | ---------- | ------------------- |
| phone_num        | string     | null: false         |
| prefecture_id    | integer    | null: false         |
| city             | string     | null: false         |
| home_number      | string     |                     |
| building_name    | string     |                     |
| telephone        | string     | null: false         |
| purchase_history | references | foreign_key:true    |

### Association

- belongs_to_active_hash:prefecture
- belongs_to :user
- belongs_to :purchase_history