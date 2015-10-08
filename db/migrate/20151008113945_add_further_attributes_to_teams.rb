class AddFurtherAttributesToTeams < ActiveRecord::Migration
  def change
  	add_column :teams, :player_one, :string
  	add_column :teams, :player_two, :string
  end
end
