json.array!(@junior_companies) do |junior_company|
  json.extract! junior_company, :id, :name, :federation_id
  json.url junior_company_url(junior_company, format: :json)
end
