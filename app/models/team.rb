class Team < ActiveRecord::Base
	has_many :users, through: :participants
  has_many :participants
  has_and_belongs_to_many :matches

  # def wins
  # 	@matches = Match.all
  # 	@matches.each do |match|
  # 		return "tesing 123" if match.winner? == team.id
  # 	end
  # end 

  # Match.where('(winning_team == team.id)').count

  # def win_counter
  # 	count = 0
  # 	if match.winning_team == team.id
  # 	 count += 1
  # 	end
  # end

end



