class Summary < ApplicationRecord
	has_many :summary_phases
	has_many :summary_users
 	has_many :users, through: :summary_users

 	accepts_nested_attributes_for :summary_users, :reject_if => :all_blank, :allow_destroy => true
end
