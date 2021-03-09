json.extract! request, :id, :payload, :reference, :created_at, :updated_at
json.url request_url(request, format: :json)
