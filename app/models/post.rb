class Post < ApplicationRecord
	# app/model/post.rb
	has_many_attached :images
	validate :image_type

	def thumbnail input
	  return self.images[input].variant(resize: '300x300!').processed
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