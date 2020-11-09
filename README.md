# テーブル設計

## users テーブル

| Column          | Type    | Options                 |
| --------------- | ------- | ----------------------- |
| nickname        | string  | null: false,unique:true |
| email           | string  | null: false,unique:true |
| password        | string  | null: false             |
| first_name      | string  | null: false             |
| last_name       | string  | null: false             |
| first_name_kana | string  | null: false             |
| last_name_kana  | string  | null: false             |
| birthdate       | date    | null: false             |

### Association

- has_many :seller_items, class_name: 'item', foreign_key: 'seller_id'
- has_many :buyer_items, class_name: 'item', foreign_key: 'buyer_id'
- has_one :credit_card, dependent: :destroy
- has_one :address, dependent: :destroy


## cardsテーブル

| Column          | Type       | Options                      |
| --------------- | ---------- | ---------------------------- |
| payjp_id        | string     | null: false,unique:true      |
| customer_id     | string     | null: false                  |
| user            | references | null: false,foreign_key:true | 

### Association

- belongs_to :user


## items テーブル

| Column          | Type      | Options                      |
| --------------- | --------- | ---------------------------- |
| name            | string    | null: false                  |
| description     | text      | null: false                  | 
| category        | string    | null: false                  |
| condition       | string    | null: false                  |
| delivery_charge | integer   | null: false                  |
| delivery_area   | string    | null: false                  |
| delivery_days   | integer   | null: false                  |
| price           | text      | null: false                  |

### Association

- has_many :item_images
- belongs_to_active_hash :prefecture
- belongs_to_active_hash :condition


## item_imagesテーブル

| Column     | Type       | Options                      |
| ---------- | ---------- | ---------------------------- |
| image      | string     | null: false                  |
| item       | references | null: false,foreign_key:true |

### Association

- belongs_to :item


## purchase_histories テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | string     | null: false |
| created_at | references | null: false, foreign_key: true |
| item       | references | null: false ,foreign_key:true  |


### Association

- belongs_to :address
- belongs_to :items

## address テーブル

| Column        | Type       | Options     |
| ------------- | ---------- | ----------- |
| phone_num     | string     | null: false |
| prefecture_id | integer    | null: false |
| city          | string     | null: false |
| address1      | string     |             |
| address2      | string     |             |
| telephone     | string     |             |

### Association

- belongs_to_active_hash:prefecture