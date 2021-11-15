class Competition < ApplicationRecord
  has_many :tournament_teams
  has_many :teams, through: :tournament_teams

end
