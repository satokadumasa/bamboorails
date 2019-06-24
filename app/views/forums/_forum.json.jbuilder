json.extract! forum, :id, :user_id, :title, :detail, :created_at, :updated_at
json.url forum_url(forum, format: :json)
