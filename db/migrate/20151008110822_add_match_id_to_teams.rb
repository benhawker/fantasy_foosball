class AddMatchIdToTeams < ActiveRecord::Migration
  def change
  	add_reference :teams, :match, index: true, foreign_key: true
  end
end
