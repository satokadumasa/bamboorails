class PageComment < ApplicationRecord
	belongs_to :user
	belongs_to :page


  validates :user_id, presence: true, numericality: true
  validates :page_id, presence: true, numericality: true
  validates :title, presence: true, length:{ maximum: 64, too_long: "最大%{count}文字まで使用できます"}
  validates :detail, presence: true, length:{ maximum: 2000, too_long: "最大%{count}文字まで使用できます"}
end
