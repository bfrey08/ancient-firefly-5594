require 'rails_helper'

RSpec.describe Player do
  before :each do
    @competition_1 = Competition.create!(name: "Men's Regional", location: 'Louisville', sport: 'soccer')
    @competition_2 = Competition.create!(name: "Women's State", location: 'New York', sport: 'soccer')

    @team_1 = Team.create!(hometown: 'Leesburg', nickname: 'Rockets')
    @team_2 = Team.create!(hometown: 'Chattenuga', nickname: 'Jammers')
    @team_3 = Team.create!(hometown: 'Syracuse', nickname: 'Hots')
    @team_4 = Team.create!(hometown: 'Rochester', nickname: 'Red Wings')

    @tt_1 = TournamentTeam.create!(competition_id: @competition_1.id, team_id: @team_1.id)
    @tt_1 = TournamentTeam.create!(competition_id: @competition_1.id, team_id: @team_2.id)
    @tt_1 = TournamentTeam.create!(competition_id: @competition_2.id, team_id: @team_3.id)
    @tt_1 = TournamentTeam.create!(competition_id: @competition_2.id, team_id: @team_4.id)

    @player_1 = Player.create!(name: 'Billy Bigshoes', age: 12, team_id: @team_1.id)
    @player_2 = Player.create!(name: 'Jimmy John', age: 15, team_id: @team_1.id)
    @player_3 = Player.create!(name: 'Paul Smith', age: 11, team_id: @team_2.id)
    @player_4 = Player.create!(name: 'Alexis Alligator', age: 14, team_id: @team_3.id)
    @player_5 = Player.create!(name: 'Sami Devine', age: 13, team_id: @team_3.id)

  end
  describe 'relationships' do
    it { should belong_to(:team) }
  end

  it 'can calculate average player age' do
    expect(Player.average_player_age).to eq(13)
  end
end
