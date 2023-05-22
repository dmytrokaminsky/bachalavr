class TestsController < ApplicationController
  before_action :set_test, only: [:show, :edit, :update]

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def destroy
    @test= Еest.find(params[:id])
    @test.destroy
    redirect_to tests_url, notice: 'Test was successfully destroyed.'
  end

  def create
    @test = Test.new(test_params)

    if @test.save
      redirect_to @test, notice: 'Test was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to @test, notice: 'Test was successfully updated.'
    else
      render :edit
    end
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :subject, :time_start, :time_finish, :time_limit, :max_grade, :creator_id)
  end
end