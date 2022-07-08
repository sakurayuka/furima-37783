
## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| password           | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| kana_first_name    | string | null: false |
| kana_last_name     | string | null: false |
| birthday           | string | null: false |

### Association
- has_many : items
- has_many : purchase _records

## items テーブル

| Column             | Type         | Options     |
| ------------------ | ------------ | ----------- |
| item_name          | string       | null: false |
| price              | string       | null: false |
| explanation        | text         | null: false |
| category           | string       | null: false |
| condition          | string       | null: false |
| postage_status     | string       | null: false |
| shipping_area      | string       | null: false |
| day_to_ship        | string       | null: false |
| user               | references   | null: false , foreign_key: true |

### Association
- belongs_to : uesr
- has_one : purchase _records

## purchase _records テーブル

| Column             | Type         | Options     |
| ------------------ | ------------ | ----------- |
| item               | references   | null: false , foreign_key: true |
| user               | references   | null: false , foreign_key: true |

### Association
- belongs_to : uesrs
- belongs_to : items
- has_one : delivary_address

## delivary_address テーブル

| Column             | Type         | Options     |
| ------------------ | ------------ | ----------- |
| delivary_post_code | string       | null: false |
| delivary_pref      | string       | null: false |
| delivary_city      | string       | null: false |
| delivary_building  | string       | 
| delivary_address   | string       | null: false |
| phone_number       | string       | null: false |
| user               | references   | null: false , foreign_key: true |

### Association
- belongs_to : purchase _records
