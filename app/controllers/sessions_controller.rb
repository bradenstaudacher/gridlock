class SessionsController < ApplicationController
  TOKEN_VERIFICATION_URL = "https://www.googleapis.com/oauth2/v1/tokeninfo"

  def google_auth
    debugger
    access_token = request.env["omniauth.auth"]
    google_response_hash = request.env["omniauth.auth"].as_json

    uid = google_response_hash["uid"]

    access_token = google_response_hash["credentials"]["token"]
    access_token_valid?(uid: uid, access_token: access_token)

    user_info = google_response_hash["info"]

    user_first_name = user_info["first_name"]
    user_last_name = user_info["last_name"]
    user_email = user_info["email"]
    user_image = user_info["image"]
  end

  def access_token_valid?(uid:, access_token:)
    verification_response = RestClient.get(TOKEN_VERIFICATION_URL, params: {access_token: token})
    verification_response["expires_in"] > 0 && verification_response["user_id"] == uid
  end
end
