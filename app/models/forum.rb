class Forum < ApplicationRecord
	belongs_to :user
	belongs_to :forum_category
  has_many :forum_comments, dependent: :delete_all
  has_many :users, through: :watch_forums

  validates :user_id, presence: true, numericality: true
  validates :forum_category_id, presence: true, numericality: true
  validates :title, presence: true, length:{ maximum: 64, too_long: "最大%{count}文字まで使用できます"}
  validates :detail, presence: true, length:{ maximum: 2000, too_long: "最大%{count}文字まで使用できます"}
end
