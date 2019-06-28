class UserInfo < ApplicationRecord
  include Rails.application.routes.url_helpers

	has_many_attached :images
	belongs_to :user
	belongs_to :pref

  validates :user_id, presence: true, numericality: true
  validates :user_name, presence: true, length:{ maximum: 32, too_long: "最大%{count}文字まで使用できます"}, uniqueness: true
  validates :mobile, presence: true, length:{ maximum: 13, too_long: "最大%{count}文字まで使用できます"}
  validates :pref_id, presence: true, numericality: true
  validates :postal_code, presence: true, length:{ maximum: 8, too_long: "最大%{count}文字まで使用できます"}
  validates :address, presence: true, length:{ maximum: 225, too_long: "最大%{count}文字まで使用できます"}
	# validate :image_type

	def thumbnail image
	  return image.variant(resize: '300x300!').processed
	end
  def image_path
    logger.debug("UserInfo.image_path Start")
    image_url = self.images.count > 0  ? url_for(self.images[0]) : '/assets/nimage.png'
  end

	private
		def image_type
			if images
			  images.each do |image|
			    if !image.content_type.in?(%('image/jpeg','image/png'))
			      errors.add(:images, 'needs to be a JPEG or PNG')
			    end
			  end
		  end
		end
end
