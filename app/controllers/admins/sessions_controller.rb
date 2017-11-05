class Admins::SessionsController < ApplicationController
  before_action :admin_must_not_login, only: [:new, :create]
  layout "session"

  def new
  end

  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin.present? &&  admin.authenticate(params[:session][:password])
      byebug
      admin_log_in admin
      flash[:success] = "Đăng nhập thành công"
      redirect_to admin_path
    else
      flash[:danger] = "Email hoặc mật khẩu không chính xác"
      redirect_to admin_login_path
    end
  end
end
