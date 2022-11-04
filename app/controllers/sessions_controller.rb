class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: session_params[:email])
    if @user && @user.authenticate(session_params[:password])
      session[:user_id] = @user.id
      redirect_to @user, notice: 'ログインしました'
    else
      flash.now[:alert] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました'
  end

  private
  def session_params
    params.require(:session).permit(:email, :password)
  end
end
