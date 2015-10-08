class AddScoresToMatches < ActiveRecord::Migration
  def change
  	add_column :matches, :team_one_score, :integer
  	add_column :matches, :team_two_score, :integer
  end
end
