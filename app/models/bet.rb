class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :race
  belongs_to :driver
end
