json.extract! dmessage, :id, :sender_id, :receiver_id, :received_at, :deleted_at, :title, :detail, :created_at, :updated_at
json.url dmessage_url(dmessage, format: :json)
