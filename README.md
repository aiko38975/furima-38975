
## usersテーブル(ユーザー情報)deviseを使用

| Column                | Type      | Options                    |
| --------------------- | --------- | -------------------------- |
| nickname              | string    | null: false                |
| email                 | string    | null: false , unique: true |
| encrypted_password    | string    | null: false                |
| first_name            | string    | null: false                |
| last_name             | string    | null: false                |
| first_name_reading    | string    | null: false                |
| last_name_reading     | string    | null: false                |
| birthday              | date      | null: false                |
### Association
- has_many : items
- has_many : purchases


## itemsテーブル（出品商品情報）  imageは記載しない

| Column           | Type       | Options                       |
| ---------------- | ------     | ----------------------------- |
| name             | string     | null: false                   |
| description      | text       | null: false                   |
| category_id      | integer    | null: false                   | ActiveHash
| condition_id     | integer    | null: false                   | ActiveHash
| shipping_fee_id  | integer    | null: false                   | ActiveHash
| shipping_pref_id | integer    | null: false                   | ActiveHash
| shipping_date_id | integer    | null: false                   | ActiveHash
| price            | integer    | null: false                   |
| user             | references | null: false, foreign_key: true|
### Association
- belongs_to : user
- has_one : purchase


## addressesテーブル（配送先住所）

| Column           | Type       | Options                       |
| ---------------- | ------     | ----------------------------- |
| postal_code      | string     | null: false                   |
| shipping_pref_id | integer    | null: false                   | ActiveHash
| city             | string     | null: false                   |
| street           | string     | null: false                   |
| building         | string     |                               |
| phone_number     | string     | null: false                   |
| purchase         | references | null: false, foreign_key: true|
## Association
- belongs_to : purchase



## purchasesテーブル(購入)

| Column           | Type       | Options                       |
| ---------------- | ---------  | ----------------------------- |
| user             | references | null: false, foreign_key: true|
| item             | references | null: false, foreign_key: true|
## Association
- belongs_to : user
- belongs_to : item
- has_one    : address