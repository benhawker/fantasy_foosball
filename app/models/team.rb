class Team < ActiveRecord::Base
	has_many :users, through: :participants
  has_many :participants
end
