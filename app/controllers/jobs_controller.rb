class JobsController < ApplicationController
  def index
    if current_user.role == "role_company"

      @jobs = Job.where(company_id: current_user.company.id)

      # Esta realizando uma comparação trazer job where o atributo company_id seja igual ao current_user company.id vai trazer todos jobs relazionado com os ids
    else
      @jobs = Job.where(interest_area_id: current_user.candidate.interest_areas)
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @interest_areas = InterestArea.all
  end

  def create
    @job = Job.new(job_params)
    @job.company = current_user.company

    # base_url = "https://cep.awesomeapi.com.br/json/#{@job.cep}"
    # cep_data = if URI.open(base_url).read
    # cep = JSON.parse(cep_data)
    # @job.long = cep['lng']
    # @job.lat = cep['lat']

    if @job.save!
      redirect_to job_path(@job), notice: 'Job criado com sucesso'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @job = Job.find(params[:id])
    @interest_areas = InterestArea.all
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to job_path(@job)
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path
  end

  def like
    @job = Job.find(params[:job_id])
    # logica para lidar com os likes precisa ser implementada
  end

  private

  def job_params
    params.require(:job).permit(:description, :cep, :address, :city, :salary, :interest_area_id)
  end
end
