class ContestsController < ApplicationController
  def show
    @contest = Contest.find(params[:id])
    @user = current_user
    @participation = Participation.new
  end

  def new
    @contest = Contest.new
  end

  def create
    @contest = Contest.new(contest_params)
    if @contest.valid?
      @contest = Contest.create!(contest_params)
      @contest.update(code: code_invit)
      GameGridGenerator.new(@contest).process
      redirect_to contest_path(@contest)
    else
      render :new
    end
  end

  def invite
    contest = Contest.find(params[:id])
    InvitationMailer.invitation(contest, params[:email]).deliver_now!
    redirect_to contest_path(contest)
  end

  def update_games
    @contest = Contest.find(params[:id])
    GameGridUpdate.new(@contest).process
    redirect_to contest_path(@contest)
  end

  private

  def code_invit
    code = ""
    8.times { code += [rand(48..57).chr, rand(97..122).chr, rand(65..90).chr].sample.to_s }
    return code
  end

  def contest_params
    params.require(:contest).permit(:category, :title, :description, :creator_id,
                                    :players_nb, :coins_init, players_attributes: [:name])
  end
end
