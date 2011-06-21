module UserSessionsHelper
  def admin_user
    redirect_to(root_path), :notice => "You do not have admin access" unless current_user.admin?
  end
end
