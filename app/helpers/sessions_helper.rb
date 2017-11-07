module SessionsHelper
  def log_in user
    session[:user_id] = user.id
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def current_user
    if session[:user_id]
      user = User.find_by(id: session[:user_id])
      @current_user = user
    end
  end

  def logged_in?
    current_user.present?
  end

  def user_must_logged_in
    unless logged_in?
      flash[:warning] = "Bạn cần đăng nhập để tiếp tục"
      redirect_to login_path
    end
  end

  def user_must_not_login
    if logged_in?
      flash[:warning] = "Bạn đã đăng nhập. Vui lòng đăng xuất để tiếp tục"
      redirect_to root_path
    end
  end
end
