json.extract! user, :id, :uid, :access_token, :first_name, :last_name, :email, :image, :created_at, :updated_at
json.url user_url(user, format: :json)
