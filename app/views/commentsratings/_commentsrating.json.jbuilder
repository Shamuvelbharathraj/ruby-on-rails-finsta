json.extract! commentsrating, :id, :no, :user_id, :comment_id, :created_at, :updated_at
json.url commentsrating_url(commentsrating, format: :json)
