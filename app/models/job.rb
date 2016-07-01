class Job < ApplicationRecord
  validates :title,       presence: true
  validates :description, presence: true
  validates :status,      presence: true

  belongs_to :project
end
