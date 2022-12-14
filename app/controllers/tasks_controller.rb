class TasksController < ApplicationController
  before_action :get_task, only: %i(edit show update destroy)
  def index
    @tasks = current_user.tasks
  end

  def new
    @task = current_user.tasks.new
  end

  def create
    @task = current_user.tasks.new(task_params)
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
    @task.destroy
    head :no_content
    # flash[:success] = 'タスクを削除しました'
    # redirect_to tasks_path
  end

  private
  def task_params
    params.require(:task).permit(:name, :description)
  end

  def get_task
    @task = current_user.tasks.find(params[:id])
  end
end
