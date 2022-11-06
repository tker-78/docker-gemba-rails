class TasksController < ApplicationController
  before_action :get_task, only: %i(edit show update destroy)
  def index
    @tasks = Task.all
  end

  def new
  end

  def create
    if @task.save
      flash[:success] = 'タスクを作成しました'
      redirect_to @task
    else
      flash.now[:danger] = 'タスクの作成に失敗しました'
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update
      flash[:success] = 'タスクをアップデートしました'
      redirect_to @task
    else
      flash.now[:denger] = 'タスクをアップデートできませんでした'
      render :edit
    end
  end

  def show
  end

  def destroy
    @task.delete
    flash[:success] = 'タスクを削除しました'
    redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:name, :description)
  end

  def get_task
    @task = Task.find(params[:id])
  end
end
