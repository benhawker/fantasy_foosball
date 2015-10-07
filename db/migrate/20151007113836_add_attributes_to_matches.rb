class AddAttributesToMatches < ActiveRecord::Migration
  def change
  	add_column :matches, :match_name, :string
  	add_column :matches, :best_of, :string
  	add_column :matches, :team_one, :string
  	add_column :matches, :team_two, :string
  end
end
