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
* has_many :records_of_purchase
* has_many :buyers_info

## Items

| Column                 | Type         | Options           |
|------------------------|--------------|-------------------|
| name                   | string       | null: false       |
| info                   | text         | null: false       |
| category               | references   | foreign_key: true |
| sales_status_id        | integer      | null: false       |
| shipping_fee_status_id | integer      | null: false       |
| scheduled_delivery_id  | integer      | null: false       |
| price_id               | integer      | null: false       |
| user                   | references   | foreign_key: true |
| prefecture_id          | integer      | null: false       |

### Association

- belongs_to :user
- belongs_to :buyers_info
- belongs_to :records_of_purchase


## RecordsOfOrder

| Column          | Type         | Options           |
|-----------------|--------------|-------------------|
| user            | references   | foreign_key: true |
| item            | references   | foreign_key: true |

### Association

- belongs_to :user
* has_many :items
* has_many :buyers_info

## BuyersInfo

| Column          | Type         | Options           |
|-----------------|--------------|-------------------|
| postal_code     | integer      | null: false       |
| prefecture      | string       | null: false       |
| city            | string       | null: false       |
| address         | string       | null: false       |
| building        | string       | null: false       |
| phone_number    | string       | null: false       |

### Association

- belongs_to :users
- belongs_to :records_of_purchase
* has_many :items