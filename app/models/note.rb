class Note < ApplicationRecord
  has_many :note_comments
  has_many :pages, dependent: :delete_all
	belongs_to :user
	belongs_to :category
  has_many :users, through: :bookmarks

  validates :user_id, presence: true, numericality: true
  validates :category_id, presence: true, numericality: true
  validates :title, presence: true, length:{ maximum: 128, too_long: "最大%{count}文字まで使用できます"}
  validates :body, presence: true, length:{ maximum: 2000, too_long: "最大%{count}文字まで使用できます"}
end
