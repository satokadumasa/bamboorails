class LoungeMember < ApplicationRecord
	belongs_to :lounge

  validates :lounge_id, presence: true, numericality: true
  validates :user_id, presence: true, numericality: true
  validates :user_name, presence: true,length:{ maximum: 32, too_long: "最大%{count}文字まで使用できます"}
  validates :image_path, presence: true,length:{ maximum: 255, too_long: "最大%{count}文字まで使用できます"}
end
