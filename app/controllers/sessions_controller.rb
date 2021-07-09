class SessionsController < ApplicationController
  before_action :already_login?, except: :destroy
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path, notice: "ログインできました。"
    else
      flash.now[:alert] = "メールアドレスかパスワードが間違っています。"
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: 'ログアウトしました。'
  end
end
