class Lounge < ApplicationRecord
	belongs_to :user
	has_many :remarks

  validates :user_id, presence: true, numericality: true
  validates :title, presence: true,length:{ maximum: 64, too_long: "最大%{count}文字まで使用できます"}
  validates :overview, presence: true,length:{ maximum: 512, too_long: "最大%{count}文字まで使用できます"}
end
