## usersテーブル

| Column          | Type   | Options     |
| --------------- | -------| ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| first_name      | string | null: false |
| last_name       | string | null: false |
| first_name_kana | string | null: false |
| last_name_kana  | string | null: false |
| birthday        | date   | null: false |

### Association
- has_many :products
- has_many :destinations
- belongs_to :card


## productsテーブル

| Column         | Type       | Options                        |
| -------------- | -------    | ------------------------------ |
| product_name   | string     | null: false                    |
| description    | text       | null: false                    |
| category_id    | references | null: false, foreign_key: true |
| status_id      |            |                                |
| postage_id     |            |                                |
| prefecture_id  |            |                                |
| days_id        |            |                                |
| price          | integer    | null: false                    |
| user_id        | references | null: false, foreign_key: true |
| image          |            |                                |


### Association
- belongs_to :destinations
- belongs_to :users
- belongs_to :status(ActiveHash)
- belongs_to :postage(ActiveHash)
- belongs_to :prefecture(ActiveHash)
- belongs_to :days(ActiveHash)
- has_one_attached :image


## destinationsテーブル

| Column        | Type       | Options                        |
| ------------  | -------    | ------------------------------ |
| postcode      | string     | null: false                    |
| prefecture_id |            |                                |
| city          | string     | null: false, foreign_key: true |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| product_id    | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- belongs_to :product
- belongs_to :prefecture(ActiveHash)

## cardsテーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| card_no | integer    | null: false                    |
| user_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## prefecture(ActiveHash)
## category(ActiveHash)
## status(ActiveHash)
## postage(ActiveHash)
## days(ActiveHash)
## images(ActiveStorage)







