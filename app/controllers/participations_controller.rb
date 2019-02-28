class ParticipationsController < ApplicationController
  def show
  end

  def create
    @contest = Contest.find_by(code: params[:code])
    if @contest
      Participation.create!(contest: @contest, user: current_user)
      render :create_success
    else
      render :create_error
    end
    # redirect_to root_path
  end
end
