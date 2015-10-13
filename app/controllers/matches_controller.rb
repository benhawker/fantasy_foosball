class MatchesController < ApplicationController
	
  def new
		@match = Match.new
		# @users = User.all
    # 2.times { @match.teams.build }
    # @team = Team.new
	end

	def create
    @match = Match.new(match_params)
    @match.teams << Team.find(params[:match][:team_one])
    @match.teams << Team.find(params[:match][:team_two])
    @match.assign_winner
    @match.team_wins
    # @match.teams << Team.find(params[:match][:winning_team])
    # p "TEAM ONE SCORE:"
    # p params[:match][:team_one_score]
    # @match.teams.first. << Team.find(params[:match][:team_one_score])
    # @match.teams. << Team.find(params[:match][:team_two_score])
    if @match.save
    	flash[:notice] = 'Match created successfully'
    	redirect_to '/'
    else
    	render 'new'
    end
	end

	def show
    @match = Match.find(params[:id])
	end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    if @match.update(match_params)
      flash[:notice] = 'Match updated successfully'
      redirect_to '/'
    else
      flash[:alert] = "Profile could not be updated"
      render 'edit'
    end
  end

  def destroy
    @match = Match.find(params[:id])
    if @match.destroy
      flash[:notice] = 'Match deleted successfully'
      redirect_to '/'
    else
      flash[:alert] = 'Sorry something went wrong. Your match was not deleted.'
      redirect_to '/'
    end
  end

  def match_params
    params.require(:match).permit(:match_name, :team_one,
    															:team_two, :best_of, 
                                  :team_one_score, :team_two_score, :winning_team)
  end

end
