class AddUserIdToParticipants < ActiveRecord::Migration
  def change
  	add_reference :participants, :user, index: true, foreign_key: true
  end
end
