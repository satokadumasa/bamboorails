class Remark < ApplicationRecord
	belongs_to :user
	belongs_to :lounge

  validates :user_id, presence: true, numericality: true
  validates :lounge_id, presence: true, numericality: true
  validates :content, presence: true,length:{ maximum: 512, too_long: "最大%{count}文字まで使用できます"}

  def resp_with_json(remarks)
  	data = []
  	remarks.each do | remark |
  		remark.user.user_info
  		datum = {id:remark.id, lounge_id:remark.id, content:remark.content, created_at:remark.created_at, user_name:remark.user.user_info ? remark.user.user_info.name : 'User-' + remark.user.id.to_s}
  		data << datum
  	end
  	return data
  end
end
