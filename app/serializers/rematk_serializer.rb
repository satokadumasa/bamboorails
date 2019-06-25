class RematkSerializer < ActiveModel::Serializer
	belongs_to :user
	class UserSerializer < ActiveModel::Serializer
		has_many :user_info
		class UserInfoSerializer < ActiveModel::Serializer
			belongs_to :user
		end
	end
end
