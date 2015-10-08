class AddTeamIdToParticipants < ActiveRecord::Migration
  def change
  	add_reference :participants, :team, index: true, foreign_key: true
  end
end
