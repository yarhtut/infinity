module ProjectsHelper
  def admin?
    current_user.type == 'AdminUser'
  end

  def exist_project?
    current_user.projects.count > 0
  end
end
