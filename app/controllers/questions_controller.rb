class QuestionsController < ApplicationController
    before_action :set_test
    before_action :set_question, only: [:show, :edit, :update, :destroy]
  
    def show
    end
  
    def new
      @question = @test.questions.build
    end
  
    def create
      @question = @test.questions.build(question_params)
      if @question.save
        redirect_to test_path(@test)
      else
        render 'new'
      end
    end
  
    def edit
    end
  
    def update
      if @question.update(question_params)
        redirect_to test_question_path(@test, @question)
      else
        render 'edit'
      end
    end
  
    def destroy
      @question.destroy
      redirect_to test_path(@test)
    end
  
    private
  
    def set_test
      @test = Test.find(params[:test_id])
    end
  
    def set_question
      @question = @test.questions.find(params[:id])
    end
  
    def question_params
      params.require(:question).permit(:title, :level)
    end
  end