class UsersController < ApplicationController
  layout "session", only: :new
  before_action :user_must_not_login, only: :new
  before_action :user_must_logged_in, only: :show

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Đăng kí thành công"
      redirect_to @user
    else
      flash[:danger] = "Đăng kí thất bại"
      redirect_to login_path
    end
  end

  private
    def user_params
      params.require(:user).permit(:fullname, :email, :password,
                                   :password_confirmation)
    end
end
