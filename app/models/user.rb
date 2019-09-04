class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable
  include DeviseTokenAuth::Concerns::User
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

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

  # def self.find_for_oauth(auth)
  #  user = User.where(uid: auth.uid, provider: auth.provider).first

  #  unless user
  #    user = User.create(
  #      uid:      auth.uid,
  #      provider: auth.provider,
  #      email:    User.dummy_email(auth),
  #      password: Devise.friendly_token[0, 20],
  #      image: auth.info.image,
  #      name: auth.info.name,
  #      nickname: auth.info.nickname,
  #      )
  #  end

  #  user
  # end

  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:     auth.info.nickname,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    User.create_unique_email,
                         password: Devise.friendly_token[0,20]
                        )
    end
    user
  end

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

  private
    def self.dummy_email(auth)
     "#{auth.uid}-#{auth.provider}@example.com"
    end
end
