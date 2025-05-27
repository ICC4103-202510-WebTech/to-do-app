class TasksController < ApplicationController
  before_action :set_task, only: [ :show, :edit, :update, :destroy ]
  before_action :set_projects, only: [ :new, :edit ]
  authorize_resource

  def index
    @tasks = Task.all
    # authorize! :index, Task
  end

  def show
    # authorize! :show, @task
  end

  def new
    @task = Task.new
    @saludo = "Hola"
  end

  def create
    task = Task.new task_params
    task.user = current_user
    if task.save
      redirect_to tasks_path(task)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @task.update task_params
      redirect_to tasks_path
    else
      redirect_to edit_task_path(@task)
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private
    def set_task
      @task = Task.find params[:id]
    end

    def task_params
      params.require(:task).permit(:name, :description, :status, :project_id)
    end

    def set_projects
      @projects = Project.all.map { |p| [ p.name, p.id ] }
    end
end
