＃ テーブル設計

##　users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  |             |
| encrypted_password  | string  |             |
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
| category            | string        | null: false                      |
| product_condition   | text          | null: false                      |
| shipping_fee_burden | string        | null: false                      |
| shipping_area       | string        | null: false                      |
| days_to_ship        | string        | null: false                      |
| price               | integer       | null: false                      |
| user                | references    |  null: false, foreign_key: true  |


### Association

- belongs_to :users
- has_one :purchase_records

##  addresses  テーブル

| Column            | Type        | options                          |
| ----------------- | ----------- | -------------------------------  |
| postcode          | integer     |  null: false                     |
| prefecture_id     | integer     |  null: false                     |
| city              | string      |  null: false                     |
| block             | string      |  null: false                     |
| building          | string      |                                  |
| phone_number      | integer     |  null: false                     |
| purchase_records  | references  |  null: false, foreign_key: true  |

### Association

- belongs_to :purchase_records

##  purchase_records  テーブル

| Column    | Type        | options                          |
| --------- | ----------- | ------------------------------   |
| user      | references  |  null: false, foreign_key: true  |
| item      | references  |  null: false, foreign_key: true  |

### Association

- belongs_to :items
- belongs_to :user
- has_one :addresses