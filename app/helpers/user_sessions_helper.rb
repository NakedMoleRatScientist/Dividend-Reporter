module UserSessionsHelper
  def admin_user
    flash[:notice] = "You do not have admin access."
    redirect_to(root_path) unless current_user.admin?
  end
end
