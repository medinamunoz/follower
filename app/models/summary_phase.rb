class SummaryPhase < ApplicationRecord
  belongs_to :summary
  belongs_to :phase
  has_many :documents

end
