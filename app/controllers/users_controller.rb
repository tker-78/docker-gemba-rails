class UsersController < ApplicationController
  before_action :get_user, only: [:edit, :show, :destroy, :update]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      flash[:success] = 'ユーザーを作成しました'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザーの作成に失敗しました'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(users_params)
      flash[:success] = 'ユーザー情報をアップデートしました'
      redirect_to @user
    else
      flash.now[:danger] = 'アップデートに失敗しました'
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @user.destroy
    flash[:success] = 'ユーザーを削除しました'
    redirect_to root_path
  end

  private
  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def get_user
    @user = User.find(params[:id])
  end
end
