class Category < ApplicationRecord
  has_many :notes

  validates :name, presence: true, length:{ maximum: 62, too_long: "最大%{count}文字まで使用できます"}
end
