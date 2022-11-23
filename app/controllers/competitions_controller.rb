class CompetitionsController < ApplicationController
  before_action :find_competition, :only => [:guess, :show]
  before_action :find_active_competition, :only => :active

  def active
    redirect_to competition_path(@competition)
  end

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
  
  def find_active_competition
    @competition = Competition.where(:is_active => true).first
  end

  def find_competition
    @competition = Competition.find(params[:id])
  end
end
