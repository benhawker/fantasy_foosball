class Match < ActiveRecord::Base
	has_and_belongs_to_many :teams

		scope :winning_team, -> { where('team_one_score || team_two_score == 10') }

		attr_accessor :assign_winner, :team_wins

  	def winner?
			return team_one if team_one_score == 10
			return team_two if team_two_score == 10
			nil
		end

		def assign_winner
			self.update(winning_team: winner?)
		end

		def team_wins
			# team = Team.find(winning_team.to_s)
			# Team.update(winning_team.to_s, wins: "1")
			Team.increment_counter(:wins, winning_team.to_s)
			# add_one to team
		end

		def team_win_percentage
			# team = Team.find(winning_team.to_s)
			# Team.update(winning_team.to_s, wins: "1")
			# add_one to team
		end

		# def tally_wins
		# 	count = 0
		# 	@team = Team.all
		# 	@team.each do |team|
		# 		if winning_team == team.id
		# 			count += 1
		# 		end
		# 	end
		# end

		  # def win_counter
  # 	count = 0
  # 	if match.winning_team == team.id
  # 	 count += 1
  # 	end
  # end
end
