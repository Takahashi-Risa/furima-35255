## Users

| Column          | Type         | Options         |
|-----------------|--------------|-----------------|
| nickname        | string       | null: false     |
| email           | string       | null: false     |
| password        | string       | null: false     |
| first_name      | string       | null: false     | 
| last_name       | string       | null: false     |
| first_name_kana | string       | null: false     |
| last_name_kana  | string       | null: false     |
| birth_date      | date         | null: false     |

### Association

* has_many :items
* has_many :records_of_purchase
* has_many :buyers_info

## Items

| Column                      | Type         | Options           |
|-----------------------------|--------------|-------------------|
| item_name                   | string       | null: false       |
| item_image                  | image        | null: false       |
| item_info                   | text         | null: false       |
| item_category               | references   | foreign_key: true |
| item_sales_status           | text         | null: false       |
| item_shipping_fee_status    | text         | null: false       |
| item_scheduled_delivery     | text         | null: false       |
| item_price                  | integer      | null: false       |
| user                        | references   | foreign_key: true |
| item_prefecture             | string       | null: false       |

### Association

- belongs_to :user
- belongs_to :category
- belongs_to :buyers_info

## ItemCategory

| Column          | Type         | Options           |
|-----------------|--------------|-------------------|
| category_name   | string       | null: false       |

### Association

* has_many :items

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

