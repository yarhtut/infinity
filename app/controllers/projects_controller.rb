# app/cojtrollers/projects_controller.rb
class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @projects = Project.all

    @project = Project.find(params[:id])

    @job = Job.new(status: 0)
    @statuses = Job::STATUSES
  end

  def new
    if current_user.admin?
      @project = Project.new
    else
      flash[:fail] = "You can't create the projects as user"
      redirect_to projects_path
    end
  end

  def create
    if current_user.admin?
      @project = Project.new(project_params)
      @project.user = current_user
      @project.save
    end
    redirect_to project_path(@project)
  end

  def edit
    @projects = Project.by_user_projects(params[:user_id], current_user)
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
