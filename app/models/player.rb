class Player < ApplicationRecord
  belongs_to :team
  def self.average_player_age
    self.average(:age)
  end
  
end
