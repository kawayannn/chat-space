#DB 設計
## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|group_id|integer|null: false|
|body|text|null: false|
|image|string||

### Association
- belongs_to :user
- belongs_to :group

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|message_id|integer|null: false|
|groip_id|integer|null: false|

### Association
- has_many :users_groups
- has_many :groups, through: :users_groups
- has_many :messages

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|user_id|integer|null: false|
|message_id|integer|null :false|

### Association
- has_many :users_groups
- has_many :users, through: :users_groups
- has_many :messages

## users_groupsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false|
|group_id|integer|null: false|

### Association
- belongs_to :group
- belongs_to :user