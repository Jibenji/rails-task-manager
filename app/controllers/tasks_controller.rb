class TasksController < ApplicationController
  before_action :load_task, only: [:destroy, :edit, :update, :show]
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def show
  end


  def create
    @task = Task.new(task_params)
    @task.save
    redirect_to task_path(@task)
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :completed)
  end

  def load_task
    @task = Task.find(params[:id])
  end
end
