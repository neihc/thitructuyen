class UserExamsController < ApplicationController
  before_action :user_must_logged_in

  def new
  end

  def create
    @user_exam = UserExam.new(user_exam_params)
    if @user_exam.save
      flash[:success] = "Completed exam!"
      redirect_to user_exam_path(@user_exam)
    else
      flash[:danger] = "Something went wrong!"
      redirect_to exams_path
    end
  end

  def show
    @user_exam = UserExam.find(params[:id])
    if @user_exam.present?
      @exam = @user_exam.exam
      @answers = @user_exam.answers.all
    else
      redirect_to exams_path
    end
  end

  private
    def user_exam_params
      params.required(:user_exam).permit(:user_id, :exam_id, exam_results_attributes: [:id, :answer_id])
    end
end
