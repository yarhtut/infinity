class Project < ApplicationRecord
  validates :title,       presence: true
  validates :description, presence: true

  has_many  :user_projects
  has_many  :user, through: :user_projects

  has_many  :jobs

end
