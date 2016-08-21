class Project < ApplicationRecord
  validates :title,       presence: true
  validates :description, presence: true

  has_many  :jobs
  belongs_to :user

  def self.by_user_projects(user_id, user)
    user.projects.where(user_id: user.id)
  end
end
