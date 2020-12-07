class Bet < ApplicationRecord
  belongs_to :user
  has_one :race
  has_one :driver
end
