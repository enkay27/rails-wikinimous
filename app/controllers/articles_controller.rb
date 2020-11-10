class ArticlesController < ApplicationController

  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new()
  end

  def create
    @task = Task.create(task_params)

    redirect_to task_path(task)
  end

  def edit
  end

  def update
    @task.update(task_params)

    redirect_to task_path
  end

  def destroy
    @task.destroy

    redirect_to task_path(task)
  end

  private

  def task_param
    params.require(:task).permit(:title, :content)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
