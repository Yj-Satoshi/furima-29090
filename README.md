# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name_kanji  | string | null: false |
| first_name_kanji   | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |


### Association

- has_many :items
- has_many :purchases


## items テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| name           | string     | null: false                    |
| explanaton     | text       | null: false                    |
| price          | integer    | null: false                    |
| category_id    | integer    | null: false                    |
| item_status_id | integer    | null: false                    |
| send_area_id   | integer    | null: false                    |
| send_date_id   | integer    | null: false                    |
| send_fee_id    | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item             | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |
| credit_card_info | string     | null: false                    |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | -------------------------------|
| purchase          | references | null: false, foreign_key: true |
| posal_code        | string     | null: false                    |
| prefecture_id     | integer    | null: false                    |
| municipalities_id | integer    | null: false                    |
| address           | string     | null: false                    |
| building          | string     |                                |
| phone_number      | string     | null: false                    |


### Association

- belongs_to :purchase
