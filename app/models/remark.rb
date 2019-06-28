class Remark < ApplicationRecord
  include Rails.application.routes.url_helpers
	belongs_to :user
	belongs_to :lounge

  validates :user_id, presence: true, numericality: true
  validates :lounge_id, presence: true, numericality: true
  validates :content, presence: true,length:{ maximum: 512, too_long: "最大%{count}文字まで使用できます"}

  def resp_with_json(remarks)
  	data = []
  	remarks.each do | remark |
  		remark.user.user_info
      image_url = image_path(remark)
  		datum = {id:remark.id, lounge_id:remark.id, content:remark.content, created_at:remark.created_at, user_name:remark.user.user_info ? remark.user.user_info.user_name : 'User-' + remark.user.id.to_s, image_url:image_url}
  		data << datum
  	end
  	return data
  end

  def image_path(remark)
    image_url =  remark.user.user_info ? remark.user.user_info.image_path() : '/assets/nimage.png'
  end
end
