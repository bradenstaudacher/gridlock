json.extract! race_result, :id, :driver_id, :race_id, :position, :points, :created_at, :updated_at
json.url race_result_url(race_result, format: :json)
