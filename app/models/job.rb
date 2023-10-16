class Job < ApplicationRecord
  validates :JobName, :presence => true
  validates :JobDescription, :presence => true
end
