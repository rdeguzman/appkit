module ApplicationHelper

def temporary_check?
  user_signed_in?

  #if user_signed_in?
  #  if current_user.id == _id
  #    true
  #  else
  ##    false
  #  end
  #else
  #  false
  #end
end

end
