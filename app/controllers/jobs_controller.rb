class JobsController < ApplicationController

  def new
    @job = Job.new
    @interest_areas = InterestArea.all
  end

  def create
    # @job = current_user.company.job.new(job_params)
    @job = Job.new(job_params)
    @job.company_id = 1

    if @job.save
      redirect_to job_path, notice: "Job criado com sucesso"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def job_params
    params.require(:job).permit(:description, :address, :salary, :interest_area_id)
  end
end
