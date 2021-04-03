## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | -------| ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birthday           | date   | null: false               |

### Association
- has_many :products
- has_many :purchase_histories



## productsテーブル

| Column         | Type       | Options                        |
| -------------- | -------    | ------------------------------ |
| product_name   | string     | null: false                    |
| description    | text       | null: false                    |
| category       | integer    | null: false                    |
| status         | integer    | null: false                    |
| postage        | integer    | null: false                    |
| prefecture     | integer    | null: false                    |
| days           | integer    | null: false                    |
| price          | integer    | null: false                    |
| user           | references | null: false, foreign_key: true |


### Association
- belongs_to :user
- has_one :purchase_history
- has_one_attached :image



## destinationsテーブル

| Column                      | Type       | Options                        |
| --------------------------- | -------    | ------------------------------ |
| postcode                    | string     | null: false                    |
| prefecture                  | integer    | null: false                    |
| city                        | string     | null: false, foreign_key: true |
| address                     | string     | null: false                    |
| building_name               | string     |                                |
| phone_number                | string     | null: false                    |
| purchase_histories          | references | null: false, foreign_key: true |


### Association
- belongs_to :purchase_history
- belongs_to :prefecture(ActiveHash)


## purchase_histories
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| user       | references | null: false, foreign_key: true |
| product    | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :product
- has_one :purchase_history




## prefecture(ActiveHash)
## category(ActiveHash)
## status(ActiveHash)
## postage(ActiveHash)
## days(ActiveHash)
## images(ActiveStorage)







