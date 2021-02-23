# テーブル設計

## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| nickname           | string  | null: false              |
| email              | string  | null: false unique: true |
| password           | string  | null: false unique: true |
| first_name         | string  | null: false              |
| last_name          | string  | null: false              |
| first_name_reading | string  | null: false              |
| last_name_reading  | string  | null: false              |
| birthday           | data    | null: false              |


### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type      | Options                      |
| ------------------- | ---------- | ---------------------------- |
| item_name           | string     | null: false                  |
| item_description    | text       | null: false                  |
| category_id         | integer    | null: false                 |
| item_condition_id   | integer    | null: false                 |
| delivery_fee_id     | integer    | null: false                 |
| shipping_area_id    | integer    | null: false                 |
| day_to_ship_id      | integer    | null: false                 |
| item_price          | integer    | null: false                  |
| user                | reference  | null: false foreign_key :true|


### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column              | Type      | Options                      |
| ------------------- | --------- | ---------------------------- |
| user                | reference | null: false foreign_key :true|
| item                | reference | null: false foreign_key :true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column          | Type      | Options                      |
| --------------- | --------- | ---------------------------- |
| postal_code     | integer   | null: false                  |
| prefecture      | string    | null: false                  |
| city            | string    | null: false                  |
| house_number    | integer   | null: false                  |
| building_name   | string    | null: false                  |
| phone_number    | integer   | null: false                  |
| purchase        | reference | null: false foreign_key :true|


### Association

- belongs_to :purchase

