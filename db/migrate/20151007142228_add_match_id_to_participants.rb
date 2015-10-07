class AddMatchIdToParticipants < ActiveRecord::Migration
  def change
  	add_reference :participants, :match, index: true, foreign_key: true
  end
end
