json.extract! note_comment, :id, :user_id, :bbs_id, :title, :body, :created_at, :updated_at
json.url note_comment_url(note_comment, format: :json)
