
## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false , unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| kana_first_name    | string | null: false |
| kana_last_name     | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many : items
- has_many : trades

## items テーブル

| Column             | Type         | Options     |
| ------------------ | ------------ | ----------- |
| item_name          | string       | null: false |
| price              | integer      | null: false |
| explanation        | text         | null: false |
| category_id        | integer      | null: false |
| condition_id       | integer      | null: false |
| postage_status_id  | integer      | null: false | 
| pref_id            | integer      | null: false |
| day_to_ship_id     | integer      | null: false |
| user               | references   | null: false , foreign_key: true |

### Association
- belongs_to : user
- has_one : trade

## trades テーブル

| Column             | Type         | Options     |
| ------------------ | ------------ | ----------- |
| item               | references   | null: false , foreign_key: true |
| user               | references   | null: false , foreign_key: true |

### Association
- belongs_to : user
- belongs_to : item
- has_one : address

## address テーブル

| Column             | Type         | Options     |
| ------------------ | ------------ | ----------- |
| post_code          | string       | null: false |
| pref_id            | string       | null: false |
| city_name          | string       | null: false |
| building_name      | string       | 
| house_number       | string       | null: false |
| phone_number       | string       | null: false |
| trade              | references   | null: false , foreign_key: true |

### Association
- belongs_to : trade
