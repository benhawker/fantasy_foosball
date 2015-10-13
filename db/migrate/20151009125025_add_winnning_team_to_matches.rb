class AddWinnningTeamToMatches < ActiveRecord::Migration
  def change
  	add_column :matches, :winning_team, :integer
  end
end
