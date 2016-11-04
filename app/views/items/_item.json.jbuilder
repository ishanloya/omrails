json.extract! item, :id, :user_id, :title, :url, :text, :created_at, :updated_at
json.url item_url(item, format: :json)