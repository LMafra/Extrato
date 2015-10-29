json.array!(@areas) do |area|
  json.extract! area, :id, :organogram_id, :name
  json.url area_url(area, format: :json)
end
