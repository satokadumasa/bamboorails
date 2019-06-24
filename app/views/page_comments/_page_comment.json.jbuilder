json.extract! page_comment, :id, :user_id, :page_id, :title, :detail, :created_at, :updated_at
json.url page_comment_url(page_comment, format: :json)
