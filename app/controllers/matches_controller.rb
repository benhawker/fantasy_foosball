class MatchesController < ApplicationController
	def new
		@match = Match.new
		@users = User.all
	end
end
