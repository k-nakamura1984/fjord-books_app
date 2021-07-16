json.extract! report, :id, :title, :comment, :created_at, :updated_at
json.url report_url(report, format: :json)
