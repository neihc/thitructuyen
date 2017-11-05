class Admins::ExamQuestionsController < ApplicationController
  def new
    exam_id = params[:exam_id].present? ? params[:exam_id] : 0
    @exam = Exam.find(exam_id)
    if @exam.present?
      @questions = Question.paginate(page: params[:page], per_page: 20)
      @exam_question = ExamQuestion.new
    else
      flash[:danger] = "Exam does not exist!"
      redirect_to admins_exams_path
    end
  end

  def create
    @exam_question = ExamQuestion.new exam_question_params
    if @exam_question.save
      flash[:success] = "Add question successfully!"
    else
      flash[:danger] = "Something went wrong!"
    end
    redirect_to admins_exam_path(id: params[:exam_question][:exam_id])
  end

  def destroy
    if ExamQuestion.find_by(exam_id: params[:exam_id], question_id: params[:question_id]).destroy
      flash[:success] = "Removed question"
    else
      flash[:danger] = "Something went wrong!"
    end
    redirect_to admins_exam_path(id: params[:exam_id])
  end

  private
    def exam_question_params
      params.require(:exam_question).permit(:exam_id, :question_id)
    end
end
