class MatchesController < ApplicationController
	
  def new
		@match = Match.new
		@users = User.all
	end

	def create
    @match = Match.new(match_params)
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
    															:team_two, :best_of)
  end

end
