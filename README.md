## Users

| Column             | Type         | Options                   |
|--------------------|--------------|---------------------------|
| nickname           | string       | null: false               |
| email              | string       | null: false, unique: true |
| encrypted_password | string       | null: false               |
| first_name         | string       | null: false               |
| last_name          | string       | null: false               |
| first_name_kana    | string       | null: false               |
| last_name_kana     | string       | null: false               |
| birth_date         | date         | null: false               |

### Association

* has_many :items
* has_many :orders

## Items

| Column                 | Type         | Options           |
|------------------------|--------------|-------------------|
| name                   | string       | null: false       |
| info                   | text         | null: false       |
| category_id            | integer      | null: false       |
| sales_status_id        | integer      | null: false       |
| shipping_fee_status_id | integer      | null: false       |
| scheduled_delivery_id  | integer      | null: false       |
| price                  | integer      | null: false       |
| user                   | references   | foreign_key: true |
| prefecture_id          | integer      | null: false       |

### Association

- belongs_to :user
- has_one :order

## Order

| Column          | Type         | Options           |
|-----------------|--------------|-------------------|
| user            | references   | foreign_key: true |
| item            | references   | foreign_key: true |

### Association

- belongs_to :user
* belongs_to :item
* has_one :buyers_info

## BuyersInfo

| Column                 | Type         | Options           |
|------------------------|--------------|-------------------|
| postal_code            | string       | null: false       |
| prefecture_id          | integer      | null: false       |
| city                   | string       | null: false       |
| address                | string       | null: false       |
| building               | string       |                   |
| phone_number           | string       | null: false       |
| order_id               | references   | foreign_key: true |

### Association

- belongs_to :order