class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'ログインしました'
      redirect_to @user
    else
      flash.now[:danger] = '入力された情報が間違っています'
      render :new
    end
  end

  def destroy
    reset_session
    flash[:success] = 'ログアウトしました'
    redirect_to root_path
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
