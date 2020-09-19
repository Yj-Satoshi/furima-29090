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
| password           | string | null: false |
| family_name_kanji  | string | null: false |
| first_name_kanji   | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_year         | string | null: false |
| birth_month        | string | null: false |
| birth_day          | string | null: false |

### Association

- has_many :item
- has_many :purchase


## items テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| item_name   | string     | null: false                    |
| item_image  | string     | null: false                    |
| explanaton  | string     | null: false                    |
| price       | string     | null: false                    |
| category    | string     | null: false                    |
| item_status | string     | null: false                    |
| send_area   | string     | null: false                    |
| send_date   | string     | null: false                    |

### Association

- belongs_to :user
- has_one :purchase


## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item             | references | null: false, foreign_key: true |
| user             | references | null: false, foreign_key: true |
| credit_card_info | string     | null: false                    |
| expriration_date | string     | null: false                    |
| securitu_code    | string     | null: false                    |
| postal_code      | string     | null: false                    |
| prefecture       | string     | null: false                    |
| municipalities   | string     | null: false                    |
| adress           | string     | null: false                    |
| building         | string     | null: true                     |

### Association

- belongs_to :item
- belongs_to :user