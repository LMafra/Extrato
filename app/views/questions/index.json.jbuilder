json.array!(@questions) do |question|
  json.extract! question, :id, :name, :dimension_id
  json.url question_url(question, format: :json)
end
