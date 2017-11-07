class ExamsController < ApplicationController
  before_action :user_must_logged_in

  def index
    @exams = Exam.paginate(page: params[:page], per_page: 10)
  end

  def show
    @exam = Exam.find(params[:id])
#    @questions = @exam.questions.all
    if @exam.present?
      @user_exam = User_exam.new
      n = @exam.questions.count
      n.times{ @user_exam.questions.build }
    else
      flash[:danger] = "Something went wrong"
      redirect_to exams_path
    end
  end
end
