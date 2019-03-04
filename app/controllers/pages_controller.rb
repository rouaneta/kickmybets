class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @user = current_user
    # @user_contests_join = current_user.participations.map { |e| e.contest }
    # @user_contests_create = current_user.contests
    @participation = Participation.new
  end
end
