json.extract! forum_category, :id, :name, :created_at, :updated_at
json.url forum_category_url(forum_category, format: :json)
