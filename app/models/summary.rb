class Summary < ApplicationRecord
	has_many :summary_phases
	has_many :phases, through: :summary_phases
	has_many :summary_users
 	has_many :users, through: :summary_users

 	attr_accessor :phases_ids

end
