class ParticipationsController < ApplicationController
  def show
  end

  def create
    @contest = Contest.find_by(code: params[:code])
    Participation.create!(contest: @contest, user: current_user)
    redirect_to root_path
  end
end
