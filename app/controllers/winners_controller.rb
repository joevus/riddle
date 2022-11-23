class WinnersController < ApplicationController
    before_action :find_competitions, :only => :board

    def create
        winner = Winner.new(
            :competition_id => params[:competition_id],
            :email => params[:email],
            :name => params[:name],
            :rank => params[:correct_answer_count]
        )

        if winner.save
            redirect_to :action => "board"
        else
            render :action => "show", :controller => "competitions", :id => params[:competition_id]
        end
    end

    def board
    end

    def index
        @winners = Winner.all
    end
end

private

def find_competitions
    @competitions = Competition.with_winners
end

def params_for_create
    params.permit(:name, :email, :competition_id, :correct_answer_count)
end