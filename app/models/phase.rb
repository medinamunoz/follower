class Phase < ApplicationRecord
	has_many :summary_phases
	has_many :summaries, through: :summary_phases
end
