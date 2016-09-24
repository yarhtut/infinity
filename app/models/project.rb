class Project < ApplicationRecord
  validates :title,       presence: true
  validates :description, presence: true

  has_many  :user_projects
  has_many  :user, through: :user_projects

  has_many  :jobs

  def self.by_user_projects(user_id, user)
    user.projects
  end
end
