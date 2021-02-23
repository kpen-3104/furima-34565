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
| year               | integer | null: false              |
| month              | integer | null: false              |
| day                | integer | null: false              |

### Association
- has_many :items
- has_many :purchases

## items テーブル

| Column              | Type      | Options                      |
| ------------------- | --------- | ---------------------------- |
| item_name           | string    | null: false                  |
| item_description    | string    | null: false                  |
| category            | string    | null: false                  |
| item_condition      | string    | null: false                  |
| delivery_fee        | string    | null: false                  |
| shipping_area       | string    | null: false                  |
| day_to_ship         | string    | null: false                  |
| item_price          | integer   | null: false                  |
| user_id             | reference | null: false foreign_key :true|


### Association

- belongs_to :user
- has_one :purchases

## purchases テーブル

| Column              | Type      | Options                      |
| ------------------- | --------- | ---------------------------- |
| user_id             | reference | null: false foreign_key :true|
| item_id             | reference | null: false foreign_key :true|

### Association

- belongs_to :items
- belongs_to :user
- has_one :addresses


## addresses テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- belongs_to :purchases

