class UsersController < ApplicationController
  layout "session", only: :new

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      #do
    else
      redirect_to :new
    end
  end

end
