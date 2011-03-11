module ApplicationHelper

  def admin_user?
    if current_user.role == 'admin'
      true
    else
      false
    end
  end

  def normal_user?
    if current_user.role == 'normal'
      true
    else
      false
    end
  end

  def authorize_task_and_redirect?(i)
    if !current_user.nil? && (current_user.id == i || admin_user?)
    else
      flash[:alert] = "You are not the owner of this resource. Only the admin or owner can use this resource. You are now redirected to the home page."
      redirect_to root_path
    end
  end

  def authorize_task?(i)
    if !current_user.nil? && (current_user.id == i || admin_user?)
      true
    else
      false
    end
  end

  def has_value?(t)
    if !t.nil? && t.length > 0
      true
    else
      false
    end
  end

  def format_date(t)
    t.strftime("%b %d %Y %l:%M %p")
  end

end
