# README
# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| nickname        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birth_year      | date   | null: false |
| birth_month     | date   | null: false |
| birth_date      | date   | null: false |


### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column        | Type          | Options                        |
| -----------   | ------------- | ------------------------------ |
| comment       | text          | null: false                    |
| category      | integer       | null: false                    |
| condition     | integer       | null: false                    |
| image         | ActiveStorage |                                |
| charge        | integer       | null: false                    |
| area          | integer       | null: false                    |
| delivery_date | integer       | null: false                    |
| price         | integer       | null: false                    |
| user          | references    | foreign_key: true              |



### Association
- belongs_to :user
- has_many :purchases


## purchases テーブル

| Column       | Type       | Options                        |
| -------------| ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item


# address テーブル

| Column        | Type          | Options                        |
| -----------   | ------------- | ------------------------------ |
| post_code     | integer       | null: false                    |
| prefectures   | integer       | null: false                    |
| city          | string        | null: false                    |
| house_num     | string        | null: false                    |
| building_name | string        |                                |
| phone_num     | string        | null: false                    |
| purchase      | references    | null: false, foreign_key: true |



### Association

- has_one :purchase
