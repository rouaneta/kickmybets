class ContestsController < ApplicationController
  def show
  end

  def new
    @contest = Contest.new
    @code = code_invit
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

  def code_invit
    code = ""
    8.times { code += [rand(48..57).chr, rand(97..122).chr, rand(65..90).chr].sample.to_s }
    return code
  end
end
