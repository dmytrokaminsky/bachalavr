class RegistrationsController < ApplicationController
    # створення користувача
    def new
      @user = User.new
    end
    def create
      @user = User.new(user_params)
      if @user.save
      # збереження параметру user id в сесії
        session[:user_id] = @user.id
        redirect_to root_path, notice: 'Акаунт успішно створено'
      else
        render :new
      end
    end
    private
    def user_params
      # параметри користувача
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end