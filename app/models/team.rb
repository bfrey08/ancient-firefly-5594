class Team < ApplicationRecord
  has_many :players
  has_many :tournament_teams
  has_many :competitions, through: :tournament_teams

  def order_av_age
    players.select('players.*, AVG(players.age) as avg_age').group('players.id').order(avg_age: :desc)
  end
end
