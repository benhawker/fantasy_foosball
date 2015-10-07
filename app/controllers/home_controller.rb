class HomeController < ApplicationController
	def index
			# @matches = Match.all.reverse
			@matches = Match.all.order(id: :desc).limit(10)
	end
end
