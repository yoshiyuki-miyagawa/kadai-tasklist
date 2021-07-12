class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def new
    @user = User.new
  end
  
  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to root_path, notice: "ユーザー登録されました。"
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def show
   
  end
  
    private
    
  def user_params
    params.permit(:email, :password, :password_confirmation)
  end
end
