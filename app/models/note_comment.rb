class NoteComment < ApplicationRecord
	belongs_to :note


  validates :user_id, presence: true, numericality: true
  validates :note_id, presence: true, numericality: true
  validates :title, presence: true, length:{ maximum: 128, too_long: "最大%{count}文字まで使用できます"}
  validates :body, presence: true, length:{ maximum: 20000, too_long: "最大%{count}文字まで使用できます"}
end
