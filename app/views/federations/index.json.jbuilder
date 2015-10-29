json.array!(@federations) do |federation|
  json.extract! federation, :id, :name, :abbreviation
  json.url federation_url(federation, format: :json)
end
