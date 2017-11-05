class SessionsController < ApplicationController
  before_action :user_must_not_login, only: [:new, :create]
  layout "session"

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user.present? &&  user.authenticate(params[:session][:password])
      log_in user
      flash[:success] = "Đăng nhập thành công"
      redirect_to root_path
    else
      flash[:danger] = "Email hoặc mật khẩu không chính xác"
      redirect_to login_path
    end
  end
end
