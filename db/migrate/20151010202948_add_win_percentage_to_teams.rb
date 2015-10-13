class AddWinPercentageToTeams < ActiveRecord::Migration
  def change
  	add_column :teams, :win_percentage, :integer
  end
end
