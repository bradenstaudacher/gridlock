Rails.application.routes.draw do
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "auth/google_oauth2/callback", to: "sessions#google_auth"
  get "auth/failure", to: redirect("/")
end
