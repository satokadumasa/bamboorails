json.extract! user_info, :id, :user_id, :user_name, :mobile, :pref_id, :postal_code, :address, :created_at, :updated_at, :image_path
json.url user_info_url(user_info, format: :json)
