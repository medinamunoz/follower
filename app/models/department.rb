class Department < ApplicationRecord
  belongs_to :establishment
  has_many :users
end
