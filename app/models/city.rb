class City < ApplicationRecord
	has_many :establishments, dependent: :destroy
end
