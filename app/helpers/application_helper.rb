module ApplicationHelper
  def active?(path)
    "active" if current_page?(path)
  end

  def admin_types
    ['AdminUser', 'SuperAdmin']
  end

  def employee?
    current_user.type == 'Employee'
  end

  def admin?
    admin_types.include?(current_user.type)
  end
end
