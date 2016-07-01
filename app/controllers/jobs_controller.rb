# Job/Controoler
class JobsController < ApplicationController
  def create
    @job = Job.new(job_params)
    @job.save
    redirect_to project_path(@job.project)
  end

  private

  def job_params
    params.require(:job).permit(:project_id, :title, :description, :status)
  end
end
