json.extract! page, :id, :user_id, :note_id, :title, :detail, :created_at, :updated_at
json.url page_url(page, format: :json)
