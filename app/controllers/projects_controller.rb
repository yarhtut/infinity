# app/cojtrollers/projects_controller.rb
class ProjectsController < ApplicationController
  def index
    @projects = Project.by_user_projects(params[:user_id], current_user)
  end

  def show
    @project = Project.find(params[:id])

    @job = Job.new(status: 0)
    @statuses = Job::STATUSES
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    @project.save
    redirect_to project_path(@project)
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
