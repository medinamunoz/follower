class Document < ApplicationRecord
  belongs_to :summary_phase
  mount_uploader :link, AttachedUploader
  validates :name, presence: true
  
end
