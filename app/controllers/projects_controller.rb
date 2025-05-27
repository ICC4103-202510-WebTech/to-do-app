class ProjectsController < ApplicationController
  before_action :set_project, only: [ :show, :edit, :update, :destroy ]
  def index
    @projects = Project.accessible_by(current_ability)
    # authorize! :index, @projects
  end

  def show
    @tasks = @project.tasks
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.new project_params
    project.user = current_user
    if project.save
      redirect_to projects_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update project_params
      redirect_to projects_path
    else
      redirect_to edit_project_path(@project)
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private
    def project_params
      params.require(:project).permit(:name)
    end

    def set_project
      @project = Project.find params[:id]
    end
end
