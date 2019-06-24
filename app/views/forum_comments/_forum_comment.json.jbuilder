json.extract! forum_comment, :id, :user_id, :forum_id, :title, :detail, :created_at, :updated_at
json.url forum_comment_url(forum_comment, format: :json)
