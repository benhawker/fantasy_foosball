class AddWinsToTeams < ActiveRecord::Migration
  def change
  	  	add_column :teams, :wins, :integer
  end
end
