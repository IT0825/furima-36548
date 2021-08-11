＃ テーブル設計

##　users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false |
| last_name           | string  | null: false |
| first_name          | string  | null: false |
| last_name_kana      | string  | null: false |
| first_name_kana     | string  | null: false |
| birth_date          | date    | null: false |

### Association

- has_many :items
- has_many :purchase_records

## items  テーブル

| Column              | Type          | Options                          |
| -------             | ------------- | -------------------------------- |
| product_name        | string        | null: false                      |
| description_of_item | text          | null: false                      |
| category_id            | integer        | null: false                      |
| product_condition_id  | integer          | null: false                      |
| shipping_fee_burden_id | integer        | null: false                      |
| prefecture_id       | integer        | null: false                      |
| days_to_ship_id        | integer        | null: false                      |
| price               | integer       | null: false                      |
| user                | references    |  null: false, foreign_key: true  |


### Association

- belongs_to :user
- has_one :purchase_record

##  addresses  テーブル

| Column            | Type        | options                          |
| ----------------- | ----------- | -------------------------------  |
| postcode          | string     |  null: false                     |
| prefecture_id     | integer     |  null: false                     |
| city              | string      |  null: false                     |
| block             | string      |  null: false                     |
| building          | string      |                                  |
| phone_number      | string     |  null: false                     |
| purchase_record  | references  |  null: false, foreign_key: true  |

### Association

- belongs_to :purchase_record

##  purchase_records  テーブル

| Column    | Type        | options                          |
| --------- | ----------- | ------------------------------   |
| user      | references  |  null: false, foreign_key: true  |
| item      | references  |  null: false, foreign_key: true  |

### Association

- belongs_to :item
- belongs_to :user
- has_one :addresse