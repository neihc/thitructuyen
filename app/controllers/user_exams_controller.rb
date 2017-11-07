class UserExamsController < ApplicationController
  before_action :user_must_logged_in

  def new
    exam_id = params[:exam_id].present? ? params[:exam_id] : 0
    user_id = params[:user_id].present? ? params[:user_id]
    @exam = Exam.find(exam_id)
    if @exam.present?
      @user_exam = User_exam.new
      n = @exam.questions.count
      n.times{ @user.questions.build }
    else
      flash[:danger] = "Something went wrong"
      redirect_to exams_path
    end
  end

  def create
  end
end
