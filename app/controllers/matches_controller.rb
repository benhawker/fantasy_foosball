class MatchesController < ApplicationController
	
  def new
		@match = Match.new
		@users = User.all
    2.times { @match.teams.build }
    # @team = Team.new
	end

	def create
    @match = Match.new(match_params)
    # p "PARAMS:"
    # p params
    # p "TEAM ID:"
    # p params[:match][:team_one]
    # p "TEAM:"
    # team = Team.find(params[:match][:team_one])
    # p team
    @match.teams << Team.find(params[:match][:team_one])
    @match.teams << Team.find(params[:match][:team_two])
    # @match.teams << Team.find(params[:team_two])
    # @match.teams << team2

    # @match.teams.build(match_params.merge({team_one: current_user}))

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
                                  :team_one_score, :team_two_score)
  end

end
