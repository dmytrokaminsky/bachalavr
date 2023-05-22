class AnswersController < ApplicationController
    before_action :set_test
    before_action :set_question
    before_action :set_answer, only: [:show, :edit, :update, :destroy]
  
    def show
    end
  
    def new
      @answer = @question.answers.build
    end
  
    def create
      @answer = @question.answers.build(answer_params)
      if @answer.save
        redirect_to test_question_path(@test, @question)
      else
        render 'new'
      end
    end
  
    def edit
    end
  
    def update
      if @answer.update(answer_params)
        redirect_to test_question_path(@test, @question)
      else
        render 'edit'
      end
    end
  
    def destroy
      @answer.destroy
      redirect_to test_question_path(@test, @question)
    end
  
    private
  
    def set_test
      @test = Test.find(params[:test_id])
    end
  
    def set_question
      @question = @test.questions.find(params[:question_id])
    end
  
    def set_answer
      @answer = @question.answers.find(params[:id])
    end
  
    def answer_params
      params.require(:answer).permit(:title, :correctness)
    end
  end