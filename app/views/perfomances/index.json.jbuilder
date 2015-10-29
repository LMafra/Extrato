json.array!(@perfomances) do |perfomance|
  json.extract! perfomance, :id, :name, :junior_companies_id, :federations_id, :role_id
  json.url perfomance_url(perfomance, format: :json)
end
