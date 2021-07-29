class SessionsController < ApplicationController
  
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'ログインしました。'
    else
      flash.now[:danger] = 'ログインに失敗しました。'
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'ログアウトしました。'
  end
  

private

  def session_params
    params.permit(:email, :password)
  end
end
