class ContestsController < ApplicationController
  def show
  end

  def new
    @contest = Contest.new
  end

  def create
    @contest = Contest.create!(contest_params)
    p "contest params : #{contest_params}"
    p "params : #{params}"
    p "contest : #{@contest.title}"
    p "contest : #{@contest}"
    p "contest : #{@contest}"
    if @contest
      # generate_players(@contest, params[:])
      p 'yes'
      generate_games(@contest.players_nb)
      redirect_to contest_path(@contest)
    else
      p 'no'
      render :new
    end
  end

  private

  # def generate_players(contest, players_names)
  #   players_names.each do |player_name|
  #     player = Player.new(name: player_name)
  #     player.contest = contest
  #     player.save!
  #   end
  # end

  def contest_params
    params.require(:contest).permit(:category, :title, :description, :code, :creator_id, :players_nb, :coins_init, players_attributes: [:name])
  end
end
