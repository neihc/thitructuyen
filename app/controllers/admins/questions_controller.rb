class Admins::QuestionsController < ApplicationController
  before_action :admin_must_logged_in

  def index
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
  end

  def update
  end

  def destroy
  end

  private
    def question_params
      params.required(:question).permit(:description,
        answers_attributes: [:content, :is_correct])
    end
end
