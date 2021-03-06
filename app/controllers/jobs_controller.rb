# Job/Controoler
class JobsController < ApplicationController
  def create
    @job = Job.new(job_params)
    @job.save
    redirect_to project_path(@job.project)
  end

  def edit
    @projects = Project.by_user_projects(current_user)
    @jobs = Job.all
    @job = Job.find(params[:id])
    @statuses = Job::STATUSES
  end

  def update
    @job = Job.find(params[:id])
    @project = Project.by_user_projects(current_user)
    if @job.update(job_params)
      redirect_to project_path(@job.project)
    else
      render 'edit'
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to project_path
  end

  private

  def job_params
    params.require(:job).permit(:project_id, :title, :description, :status)
  end
end
