module Projects
  class TasksController < ApplicationController
    before_action :set_project
    def new
      @task = @project.tasks.new
    end

    def create
      @task = @project.tasks.new task_params
      if @task.save
        redirect_to project_path(@project)
      else
        redirect_to new_project_task_path(@project)
      end
    end

    private
      def set_project
        @project = Project.find params["project_id"]
      end

      def task_params
        params.require(:task).permit(:name, :description)
      end
  end
end
