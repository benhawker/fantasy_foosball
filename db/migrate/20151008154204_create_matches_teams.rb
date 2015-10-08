class CreateMatchesTeams < ActiveRecord::Migration
  def change
    create_table :matches_teams do |t|
    	t.references :match_id, null: false
    	t.references :team_id, null: false
    end
  end
end
