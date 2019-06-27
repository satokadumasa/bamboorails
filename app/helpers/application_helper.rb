module ApplicationHelper
	# 改行コードを改行タグに変換
	def br(str) 
	  html_escape(str).gsub(/\r\n|\r|\n/, "<br />").html_safe 
	end

	# ユーザーがカレントユーザーと一致しているかどうかチェック		
  def current_user?(user)
     user == current_user
  end

  def username(user)
  	user.user_info ? user.user_info.user_name : 'User-' + user.id.to_s
  end
end
