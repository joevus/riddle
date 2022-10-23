class CompetitionsController < ApplicationController
  before_action :find_competition, :only => [:guess, :show]

  def guess
    if @competition.process_guess(params[:guess])
      render "congratulations"
      return
    end
    render "nope"
  end

  def show
  end

private
  
  def find_competition
    @competition = Competition.find(params[:id])
  end
end
