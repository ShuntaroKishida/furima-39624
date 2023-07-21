# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_date         | date   | null: false               |

### Association

- has_many :items
- has_many :transactions

## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| name               | string  | null: false |
| price              | string  | null: false |
| explain            | string  | null: false |
| seller             | string  | null: false |
| category           | string  | null: false |
| condition          | string  | null: false |
| charge             | string  | null: false |
| prefecture_id      | integer | null: false |
| criterion          | string  | null: false |

### Association

- has_one :transaction
- belongs_to :user

## transactions テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |

### Association

- has_one :shipping
- belongs_to :item
- belongs_to :user

## shippings テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| postal             | string  | null: false |
| prefecture_id      | integer | null: false |
| city               | string  | null: false |
| address            | string  | null: false |
| building           | string  |             |
| phone              | string  | null: false |

### Association

- belongs_to :transaction