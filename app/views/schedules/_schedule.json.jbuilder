json.extract! schedule, :id, :user_id, :title, :detail, :started_at, :ended_at, :created_at, :updated_at
json.url schedule_url(schedule, format: :json)
