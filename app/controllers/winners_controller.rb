class WinnersController < ApplicationController
    def create
        winner = Winner.new(
            :competition_id => params[:competition_id],
            :email => params[:email],
            :name => params[:name],
            :rank => params[:correct_answer_count]
        )
        binding.pry
        if winner.save
            redirect_to :action => "index"
        else
            render :action => "show", :controller => "competitions", :id => params[:competition_id]
        end
    end

    def index
        @winners = Winner.all
    end
end

private

def params_for_create
    params.permit(:name, :email, :competition_id, :correct_answer_count)
end