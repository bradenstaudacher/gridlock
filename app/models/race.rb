class Race < ApplicationRecord
  has_many :race_results
  has_many :drivers, through: :race_results
  has_many :bets
end
