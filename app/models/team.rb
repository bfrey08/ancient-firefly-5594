class Team < ApplicationRecord
  has_many :players
  has_many :tournament_teams
  has_many :competitions, through: :tournament_teams
end
