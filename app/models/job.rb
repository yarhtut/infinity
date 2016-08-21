#
class Job < ApplicationRecord

  STATUSES = { 0 => 'unstarted', 1 => 'started', 2 => 'completed' }.freeze

  validates :title,       presence: true
  validates :description, presence: true
  validates :status,      presence: true

  belongs_to :project

  def humanize_status
    STATUSES[status]
  end
end
