module Admins::SessionsHelper
  def admin_log_in admin
    session[:admin_id] = admin.id
  end

  def admin_log_out
    session.delete(:admin_id)
    @current_admin = nil
  end

  def current_admin
    if session[:admin_id]
      admin = Admin.find_by(id: session[:admin_id])
      @current_admin = admin
    end
  end

  def admin_logged_in?
    current_admin.present?
  end

  def admin_must_logged_in
    unless admin_logged_in?
      flash[:warning] = "Bạn cần đăng nhập để tiếp tục"
      redirect_to admin_login_path
    end
  end

  def admin_must_not_login
    if admin_logged_in?
      flash[:warning] = "Bạn đã đăng nhập. Vui lòng đăng xuất để tiếp tục"
      redirect_to admin_path
    end
  end
end
