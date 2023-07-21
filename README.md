# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birth_date_1i      | string | null: false |
| birth_date_2i      | string | null: false |
| birth_date_3i      | string | null: false |

### Association

- has_many :items

## items テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| image              | string | null: false |
| name               | string | null: false |
| price              | string | null: false |
| explain            | string | null: false |
| seller             | string | null: false |
| category           | string | null: false |
| condition          | string | null: false |
| charge             | string | null: false |
| area               | string | null: false |
| criterion          | string | null: false |

### Association

- has_one :transaction
- belongs_to :users

## transactions テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item               | references | null: false, foreign_key: true |
| payment            | references | null: false, foreign_key: true |
| shipping           | references | null: false, foreign_key: true |

### Association

- has_one :shipping
- belongs_to :transactions

## shippings テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| postal             | string | null: false |
| prefecture         | string | null: false |
| city               | string | null: false |
| address            | string | null: false |
| building           | string | null: false |
| phone              | string | null: false |

### Association

- belongs_to :transactions