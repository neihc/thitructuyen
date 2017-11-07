class Admins::QuestionsController < ApplicationController
  before_action :admin_must_logged_in

  def index
    @questions = Question.paginate(page: params[:page], per_page: 10)
  end

  def new
    @question = Question.new
    4.times{ @question.answers.build }
  end

  def create
    @question = Question.new question_params
    if @question.save
      flash[:success] = "Tạo câu hỏi thành công"
      redirect_to new_admins_question_path
    else
      flash[:danger] = "Không tạo được câu hỏi"
      redirect_to new_admins_question_path
    end
  end

  def show
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes question_params
      flash[:success] = "Your question has been updated!"
      redirect_to admins_questions_path
    else
      flash[:danger] = "Something went wrong!"
      redirect_to new_admins_question_path(@question)
    end
  end

  def destroy
    if Question.find(params[:id]).destroy
      flash[:success] = "Your question has been deleted!"
      redirect_to admins_questions_path
    else
      flash[:danger] = "Something went wrong!"
      redirect_to admins_questions_path
    end
  end

  private
    def question_params
      params.required(:question).permit(:description,
        answers_attributes: [:id, :content, :is_correct])
    end
end
