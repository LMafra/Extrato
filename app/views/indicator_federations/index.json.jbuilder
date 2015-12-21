json.array!(@indicator_federations) do |indicator_federation|
  json.extract! indicator_federation, :id, :name, :value
  json.url indicator_federation_url(indicator_federation, format: :json)
end
