class ForumComment < ApplicationRecord
	belongs_to :user
	belongs_to :forum

  validates :user_id, presence: true, numericality: true
  validates :forum_id, presence: true, numericality: true
  validates :title, presence: true, length:{ maximum: 32, too_long: "最大%{count}文字まで使用できます"}
  validates :detail, presence: true, length:{ maximum: 2000, too_long: "最大%{count}文字まで使用できます"}
end
