json.extract! breadcrumb, :id, :name, :description, :code, :progress, :user_created_id, :user_tested_id, :created_at, :updated_at
json.url breadcrumb_url(breadcrumb, format: :json)
