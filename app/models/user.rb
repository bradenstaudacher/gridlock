class User < ApplicationRecord
  validates_presence_of :uid, :access_token, :first_name, :last_name, :email
end
