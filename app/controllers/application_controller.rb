class ApplicationController < ActionController::Base

  protected

  def after_sign_in_path_for(resource)
    case resource
    when Admin
    root_path
    when User
    posts_path
    end
  end

   def after_sign_out_path_for(resource)
  if resource == :admin
       new_admin_session_path
  else
       root_path
  end
  end
end
