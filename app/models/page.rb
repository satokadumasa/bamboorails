class Page < ApplicationRecord
	belongs_to :user
	belongs_to :note
	has_many :page_comments


  validates :user_id, presence: true, numericality: true
  validates :note_id, presence: true, numericality: true
  validates :title, presence: true, length:{ maximum: 64, too_long: "最大%{count}文字まで使用できます"}
  validates :detail, presence: true, length:{ maximum: 20000, too_long: "最大%{count}文字まで使用できます"}

  def previous
  	Page.where(user_id: self.user_id).where(note_id: self.note_id).where("created_at < ? and id < ?",self.created_at, self.id).order("created_at desc,id desc").first
  end

  def next
  	Page.where(user_id: self.user_id).where(note_id: self.note_id).where("created_at > ? and id > ?",self.created_at, self.id).order("created_at desc,id desc").reverse.first
  end
end
