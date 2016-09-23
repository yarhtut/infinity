class ProjectPolicy < ApplicationPolicy
  def update?
    # reord.user_id == user.id || user.type == 'AdminUser'
    record.user_id == user.id || admin_types.include?(user.type)
  end

  def show?
    # reord.user_id == user.id || user.type == 'AdminUser'
    # admin_types.include?(user.type)
  end
end
