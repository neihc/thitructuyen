class Admins::ExamCategoriesController < ApplicationController
  def new
    exam_id = params[:exam_id].present? ? params[:exam_id] : 0
    @exam = Exam.find(exam_id)
    if @exam.present?
      @categories = Category.paginate(page: params[:page], per_page: 20)
      @exam_category = ExamCategory.new
    else
      flash[:danger] = "Exam does not exist!"
      redirect_to admins_exams_path
    end
  end

  def create
    @exam_category = ExamCategory.new exam_category_params
    if @exam_category.save
      flash[:success] = "Add category successfully!"
    else
      flash[:danger] = "Something went wrong!"
    end
    redirect_to admins_exam_path(id: params[:exam_category][:exam_id])
  end

  def destroy
    if ExamCategory.find_by(exam_id: params[:exam_id], category_id: params[:category_id]).destroy
      flash[:success] = "Removed category"
    else
      flash[:danger] = "Something went wrong!"
    end
    redirect_to admins_exam_path(id: params[:exam_id])
  end

  private
    def exam_category_params
      params.require(:exam_category).permit(:exam_id, :category_id)
    end
end
