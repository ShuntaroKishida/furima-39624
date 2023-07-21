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

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| price              | integer    | null: false                    |
| explain            | text       | null: false                    |
| category_id        | string     | null: false                    |
| condition_id       | string     | null: false                    |
| charge_id          | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| criterion_id       | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

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

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal             | string     | null: false                    |
| prefecture_id      | integer    | null: false                    |
| city               | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| phone              | string     | null: false                    |
| transaction        | references | null: false, foreign_key: true |

### Association

- belongs_to :transaction