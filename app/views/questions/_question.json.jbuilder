json.extract! question, :id, :body, :answer, :subject_id, :created_at, :updated_at
json.url question_url(question, format: :json)
