class HomeController < ApplicationController
	def index
		@matches = Match.all.order(id: :desc).limit(10)
	end

	def ranking
		@teams = Team.all
	end
end
