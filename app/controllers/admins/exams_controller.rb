class Admins::ExamsController < ApplicationController
  before_action :admin_must_logged_in

  def new
    @exam = Exam.new
  end

  def create
    @exam = Exam.new(exam_params)
    if @exam.save
      flash[:success] = "Your exam has been created successfully!"
      redirect_to admins_exams_path
    else
      flash[:danger] = "Something went wrong!"
      redirect_to new_admins_exam_path
    end
  end

  def index
    @exams = Exam.paginate(page: params[:page], per_page: 20)
  end

  def show
    @exam = Exam.find(params[:id])
    @questions = @exam.questions.paginate(page: params[:page], per_page: 20)
    @categories = @exam.categories.all
  end

  def edit
    @exam = Exam.find(params[:id])
  end

  def update
    @exam = Exam.find(params[:id])
    if @exam.update_attributes(exam_params)
      flash[:success] = "Your category has been updated!"
      redirect_to admins_exams_path
    else
      flash[:danger] = "Something went wrong!"
      redirect_to edit_admins_exam_path(@exam)
    end
  end

  def destroy
    if Exam.find(params[:id]).destroy
      flash[:success] = "Category has been destroyed!"
      redirect_to admins_exams_path
    else
      flash[:danger] = "Something went wrong!"
      redirect_to admins_exams_path
    end
  end

  private
    def exam_params
      params.require(:exam).permit(:name, :description)
    end
end
