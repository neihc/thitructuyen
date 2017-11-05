class Admins::SessionsController < ApplicationController
  before_action :admin_must_not_login, only: [:new, :create]
  before_action :admin_must_logged_in, only: [:destroy]
  layout "session"

  def new
  end

  def create
    admin = Admin.find_by(email: params[:session][:email].downcase)
    if admin.present? &&  admin.authenticate(params[:session][:password])
      admin_log_in admin
      flash[:success] = "Login successfully!"
      redirect_to admin_path
    else
      flash[:danger] = "Email or password is not correct!"
      redirect_to admin_login_path
    end
  end

  def destroy
    admin_log_out
    flash[:success] = "Logout successfully!"
    redirect_to admin_login_path
  end
end
