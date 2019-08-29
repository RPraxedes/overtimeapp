class PostPolicy < ApplicationPolicy
  def update?
    # Case1 = user of record
    record.user_id == user.id || admin_types.include?(user.type)
    # Case2 = admin user
  end
end
