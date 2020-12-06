class SessionsController < ApplicationController
  TOKEN_VERIFICATION_URL = "https://www.googleapis.com/oauth2/v1/tokeninfo"

  def google_auth
    access_token = request.env["omniauth.auth"]
    google_response_hash = request.env["omniauth.auth"].as_json

    uid = google_response_hash["uid"]

    access_token = google_response_hash["credentials"]["token"]
    access_token_valid?(uid: uid, access_token: access_token)

    user_info = google_response_hash["info"]
    first_name = user_info["first_name"]
    last_name = user_info["last_name"]
    email = user_info["email"]
    image = user_info["image"]
    user = User.create!(uid: uid, access_token: access_token, first_name: first_name, last_name: last_name, email: email, image: image)
    debugger
    render status: 200, json: user.to_json
  end

  def access_token_valid?(uid:, access_token:)
    verification_response = RestClient.get(TOKEN_VERIFICATION_URL, params: {access_token: access_token})
    parsed_response = JSON.parse(verification_response)
    parsed_response["expires_in"] > 0 && parsed_response["user_id"] == uid
  end
end
