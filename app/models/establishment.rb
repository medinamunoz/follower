class Establishment < ApplicationRecord
  belongs_to :city
  has_many :departments
end
