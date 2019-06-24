class WatchForum < ApplicationRecord
	belongs_to :user
	belongs_to :forum
end
