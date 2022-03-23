class CompetitionsController < ApplicationController
  before_action :find_competition, :only => [:show]

  def guess
  end

  def show
  end

private
  
  def find_competition
    @competition = Competition.find(params[:id])
  end
end
