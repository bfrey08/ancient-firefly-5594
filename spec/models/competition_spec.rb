require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it { should have_many(:tournament_teams) }
    it {should have_many(:teams).through(:tournament_teams)}
  end
end
