class Driver < ApplicationRecord
  has_many :race_results
  has_many :races, through: :race_results
end
