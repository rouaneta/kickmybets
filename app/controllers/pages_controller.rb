class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    redirect_to dashboard_path if current_user
  end

  def dashboard
    @user = current_user
    @participation = Participation.new
  end
end
