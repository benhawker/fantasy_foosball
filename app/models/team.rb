class Team < ActiveRecord::Base
	has_many :users, through: :participants
  has_many :participants
  has_and_belongs_to_many :matches
end
