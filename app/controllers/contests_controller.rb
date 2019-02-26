class ContestsController < ApplicationController
  def show
  end

  def new
    @contest = Contest.new
  end

  def create
    @contest = Contest.new(contest_params)
    if @contest.save
      redirect_to contest_path(@contest)
    else
      render :new
    end
  end

  private
  def contest_params
    
  end
end
