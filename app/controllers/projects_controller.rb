# app/cojtrollers/projects_controller.rb
class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    @projects = Project.by_user_projects(current_user)
    @project = Project.new
  end

  def show
    @projects = Project.by_user_projects(current_user)
    @job = Job.new(status: 0)
    @statuses = Job::STATUSES
  end

  def new
    if current_user.type == 'AdminUser'
      @project = Project.new
      @projects = Project.by_user_projects(current_user)
    else
      render :index
    end
  end

  def create
    @project = Project.new(project_params)
    @project.save
    @user_projects = UserProject.create(project_id: @project.id, user_id: current_user.id)
    if @project.save && @user_projects.save
      redirect_to @project, notice: 'Your Project was created successfully.'
    else
      redirect_to project_path
    end
  end

  def edit
    authorize @project
    @projects = Project.by_user_projects(current_user)
  end

  def update
    authorize @project

    if @project.update(project_params)
      redirect_to @project
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:title, :description)
  end

  def set_project

    @project = Project.find(params[:id])
  end
end
