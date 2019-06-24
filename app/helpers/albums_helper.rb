module AlbumsHelper
	def disp_image image
		width_org = image.blob.metadata.has_key?(:width) ? image.blob.metadata[:width] : 300
		height_org = image.blob.metadata.has_key?(:height) ? image.blob.metadata[:height] : 300
		# p "image:" << image.inspect
		# p "width_org:" << width_org.to_s
		# p "height_org:" << height_org.to_s
		width = 0.to_f
		height = 0.to_f
		rate = 0.to_f
		if (height_org > 300 || width_org > 300)
			# p "width_org(1):" << width_org.to_s
			# p "height_org(1):" << height_org.to_s
			rate = (width_org >= height_org) ? (300.to_f / width_org.to_f).to_f : (300.to_f / height_org.to_f).to_f
			width = width_org.to_f * rate.to_f
			height = height_org.to_f * rate.to_f
			# p "width(1):" << width.to_s
			# p "height(1):" << height.to_s
		else
			width = width_org
			height = height_org
			# p "width(2):" << width.to_s
			# p "height(2):" << height.to_s
		end
		# p "width(3):" << width.to_s
		# p "height(3):" << height.to_s
		size_str = width.floor.to_s << "x" << height.floor.to_s
		return image_tag image, :size => size_str.to_s
	end
end
