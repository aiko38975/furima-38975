
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
| category         | string     | null: false                   |
| condition        | string     | null: false                   |
| shipping_fee     | integer    | null: false                   |
| shipping_pref    | string     | null: false                   |
| shipping_date    | string     | null: false                   |
| price            | integer    | null: false                   |
| user             | references | null: false, foreign_key: true|
### Association
- belongs_to : user
- has_one : purchase


## adressesテーブル（配送先住所）

| Column           | Type       | Options                       |
| ---------------- | ------     | ----------------------------- |
| postal_code      | integer    | null: false                   |
| prefecture       | string     | null: false                   |
| city             | string     | null: false                   |
| street           | string     | null: false                   |
| building         | string     | null: false                   |
| phone_number     | integer    | null: false                   |
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
- belongs_to : address