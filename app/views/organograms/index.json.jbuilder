json.array!(@organograms) do |organogram|
  json.extract! organogram, :id, :federation_id, :junior_company_id, :date_initial, :date_final
  json.url organogram_url(organogram, format: :json)
end
