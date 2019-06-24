class Album < ApplicationRecord
	has_many_attached :images
	belongs_to :user

  validates :user_id, presence: true, numericality: true
  validates :title, presence: true, length:{ maximum: 128, too_long: "最大%{count}文字まで使用できます"}
  validates :description, presence: true, length:{ maximum: 1000, too_long: "最大%{count}文字まで使用できます"}

	def thumbnail image
	  return image.variant(resize: '300x300!').processed
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
