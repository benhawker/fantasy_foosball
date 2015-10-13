class TeamsController < ApplicationController

	def index
		@teams = Team.all
	end

	def new
		@team = Team.new
		@users = User.all
	end

	def create
    @team = Team.new(team_params)
    if @team.save
    	flash[:notice] = 'Team created successfully'
    	redirect_to teams_path
    else
    	render 'new'
    end
	end

	def show
		@team = Team.find(params[:id])
	end

	# def destroy
 #    @team = Team.find(params[:id])
 #    if @team.destroy
 #      flash[:notice] = 'Team deleted successfully'
 #      redirect_to '/'
 #    else
 #      flash[:alert] = 'Sorry something went wrong. Your team was not deleted.'
 #      redirect_to '/'
 #    end
 #  end

	def team_params
    params.require(:team).permit(:player_one, :player_two)
  end
end
