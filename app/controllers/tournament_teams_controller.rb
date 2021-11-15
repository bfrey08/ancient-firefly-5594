class TournamentTeamsController < ApplicationController
  def new
    @team = Team.find_by(nickname: params[:nickname])
    TournamentTeam.create(competition_id: params[:id], team_id: @team.id)
    redirect_to "/competitions/#{params[:id]}"
  end
end
