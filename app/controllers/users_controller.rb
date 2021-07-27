class UsersController < ApplicationController
  skip_before_action :require_user_logged_in
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url, notice: "ユーザー登録されました。"
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

    private
    
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
