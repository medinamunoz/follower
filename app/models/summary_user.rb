class SummaryUser < ApplicationRecord
  belongs_to :summary
  belongs_to :user

  delegate :name, :sure_name, to: :user, prefix: true, allow_nil: true
end
