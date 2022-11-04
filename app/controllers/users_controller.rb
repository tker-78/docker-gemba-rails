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
      redirect_to @user, notice: 'ユーザーを作成しました'
    else
      flash[:notice] = 'ユーザーの作成に失敗しました'
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(users_params)
      redirect_to @user, notice: 'ユーザー情報をアップデートしました'
    else
      flash[:notice] = 'アップデートに失敗しました'
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'ユーザーを削除しました'
  end

  private
  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def get_user
    @user = User.find(params[:id])
  end
end
