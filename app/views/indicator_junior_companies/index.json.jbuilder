json.array!(@indicator_junior_companies) do |indicator_junior_company|
  json.extract! indicator_junior_company, :id, :name, :value, :id_indicator, :id_junior_company
  json.url indicator_junior_company_url(indicator_junior_company, format: :json)
end
