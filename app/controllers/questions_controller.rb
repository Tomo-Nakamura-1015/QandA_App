class QuestionsController < ApplicationController
  before_action :set_action, only: [:show, :edit, :update, :destroy]
  
  def index
    @questions = Question.all.order(created_at: :desc)
  end

  def show
    @answer = Answer.new
  end

  def new
    @question = Question.new
 
  end
  
  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to root_path ,notice: '投稿完了しました！'
    else
      flash[:alert] = "もう一度やり直してください！"
      render :new
    end
  end

  def edit
  end
  
  def update
    if @question.update(question_params)
      redirect_to  root_path ,notice: '編集完了しました！'
    else
      flash[:alert] = "もう一度やり直してください！"
      render :edit
    end
  end
  
  def destroy
    @question.destroy
    redirect_to root_path ,notice: "削除しました！"
  end
  
  private
    def set_action
      @question = Question.find(params[:id])
    end
  
  
    def question_params
      params.require(:question).permit(:name, :title, :content)
    end
   
end
