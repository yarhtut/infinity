class ProjectPolicy < ApplicationPolicy
  def update?
    # reord.user_id == user.id ||
   user.type == 'AdminUser'
  end

  def show?
    user.type == 'AdminUser'
  end

  def new?
    # reord.user_id == user.id || user.type == 'AdminUser'
    user.type == 'AdminUser'
  end
end
