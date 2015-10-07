class User < ActiveRecord::Base
  has_many :participants

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
