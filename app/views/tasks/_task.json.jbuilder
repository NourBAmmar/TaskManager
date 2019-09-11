json.extract! task, :id, :title, :body, :user_id, :domain, :done, :created_at, :updated_at
json.url task_url(task, format: :json)
