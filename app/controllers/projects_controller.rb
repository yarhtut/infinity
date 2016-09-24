# app/cojtrollers/projects_controller.rb
class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]
  def index
    @projects = Project.by_user_projects(params[:user_id], current_user)
    @project = Project.new
  end

  def show
    authorize @project
    @projects = Project.all
    @job = Job.new(status: 0)
    @statuses = Job::STATUSES
  end

  def new
    @project = Project.new
    @projects = Project.by_user_projects(params[:user_id], current_user)
  end

  def create
    @project = Project.new(project_params)
    @project.user = current_user
    if @project.save
      redirect_to @project, notice: 'Your Project was created successfully.'
    else
      render :new
    end
  end

  def edit
    authorize @project
    @projects = Project.by_user_projects(params[:user_id], current_user)
  end

  def update
    authorize @project

    if @project.update(project_params)
      redirect_to @project
      render 'edit'
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
