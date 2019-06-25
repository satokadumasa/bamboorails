class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :user_info
  has_many :albums
  has_many :notes
  has_many :forums
  has_many :note_comments
  has_many :schedules
	has_many :careers
  has_many :lounges

  has_many :bookmarks
  has_many :watch_forums
  has_many :notes, through: :bookmarks
  has_many :forums, through: :watch_forums

  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  has_many :send_messages, foreign_key: "sender_id", class_name: "Dmessage", dependent: :destroy
  has_many :recv_messages, foreign_key: "receiver_id", class_name: "Dmessage", dependent: :destroy

  def is_admin
    return self.admin === true
  end

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end

  def is_bookmarked(note_id)
    bookmarks = Bookmark.where(note_id: note_id).where(user_id: self.id)
    ret = bookmarks.count
  end

  def is_watching_forum(forum_id)
    watch_forums = WatchForum.where(forum_id: forum_id).where(user_id: self.id)
    ret = watch_forums.count
  end
end