class News < ApplicationRecord
	has_many :categories
	belongs_to :user
end
