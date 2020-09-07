# テーブル設計

## users テーブル
| Column                 | Type    | Options     |
| ---------------------  | ------- | ----------- |
| username               | string  | null: false |
| email                  | string  | null: false |
| password               | string  | null: false |
| password_confirmation  | string  | null: false |
| birthday               | date    | null: false |

### Association
- has_many :restaurants
- has_many :comments


## restaurants テーブル
| Column                  | Type     | Options     |
| ----------------------- | -------- | ----------- |
| username                | string   | null: false |
| day                     | date     | null: false |
| time                    | string   |             |
| prefecture_id           | integer  | null: false |
| station                 | string   | null: false |
| name                    | string   | null: false |
| genre                   | string   | null: false |
| menu                    | string   | null: false |
| price                   | integer  | null: false |
| remark                  | string   |             |

### Association
- belongs_to :user
- has_many :comments


## comments テーブル
| Column                  | Type     | Options     |
| ----------------------- | -------- | ----------- |
| user_id                 | integer  |             |
| restaurant_id           | integer  |             |
| text                    | text     |             |

### Association
- belongs_to :user
- belongs_to :restaurant







