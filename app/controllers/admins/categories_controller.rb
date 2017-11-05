class Admins::CategoriesController < ApplicationController
  before_action :admin_must_logged_in

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(name: params[:category][:name])
    if @category.save
      flash[:success] = "Your category has been created successfully!"
      redirect_to admins_categories_path
    else
      flash[:danger] = "Something went wrong!"
      redirect_to new_admins_category_path
    end
  end

  def index
    @categories = Category.paginate(page: params[:page], per_page: 20)
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(name: params[:category][:name])
      flash[:success] = "Your category has been updated!"
      redirect_to admins_categories_path
    else
      flash[:danger] = "Something went wrong!"
      redirect_to new_admins_category_path(@category)
    end
  end

  def destroy
    if Category.find(params[:id]).destroy
      flash[:success] = "Category has been destroyed!"
      redirect_to admins_categories_path
    else
      flash[:danger] = "Something went wrong!"
      redirect_to admins_categories_path
    end
  end
end
