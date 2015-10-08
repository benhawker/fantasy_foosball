class CreateMatchesTeams < ActiveRecord::Migration
  def change
    create_table :matches_teams do |t|
    	t.integer :match_id, null: false
    	t.integer :team_id, null: false
    end
  end
end
