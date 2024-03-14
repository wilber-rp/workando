class JobsController < ApplicationController
  def index
    if current_user.role == "role_company"
      @jobs = Job.where(company_id: current_user.company.id)
      # Esta realizando uma comparação trazer job where o atributo company_id seja igual ao current_user company.id vai trazer todos jobs relazionado com os ids
    else
      mapbox_api_key = ENV['MAPBOX_API_KEY']
      alljobs = Job.where(interest_area_id: current_user.candidate.interest_areas)

      alljobs.each do |job|
        if job.lat != nil && job.lat != "undefined" && current_user.candidate.lat != nil && current_user.candidate.lat != "undefined"
          url = "https://api.mapbox.com/directions-matrix/v1/mapbox/driving/#{current_user.candidate.long.to_f},#{current_user.candidate.lat.to_f};#{job.long.to_f},#{job.lat.to_f}?sources=1&annotations=distance&access_token=#{mapbox_api_key}"
          json_data = URI.open(url).read
          parsed_data = JSON.parse(json_data)
          distance = (parsed_data['distances'][0][0] / 1000.0).round(1)
          existing_distance = Distance.find_by(candidate: current_user.candidate, job: job)

          if existing_distance
            existing_distance.update(distance: distance)
            puts "Instância de Distance existente atualizada com sucesso!"
          else
            distance = Distance.create(candidate: current_user.candidate, job: job, distance: distance)

            if distance.persisted?
              puts "Nova instância de Distance criada com sucesso!"
            else
              puts "Falha ao criar nova instância de Distance."
            end
          end
        end
      end
      # @jobs = Job.where(interest_area_id: current_user.candidate.interest_areas).joins(:distances).order('distances.distance ASC')
      @jobs = Job.where(interest_area_id: current_user.candidate.interest_areas).joins(:distances).where.not(id: Match.where(candidate_id: current_user.candidate.id).pluck(:job_id)).order('distances.distance ASC')
      @job = @jobs.first
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @interest_areas = InterestArea.all
    @company = current_user.company
  end

  def create
    @job = Job.new(job_params)
    @job.company = current_user.company

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
    redirect_to root_path
  end

  def like
    @job = Job.find(params[:job_id])
    @match = Match.find(params[:match_id])
    @match.matched = true
    if @match.save
      Chatroom.new(match: @match)
      redirect_to match_path(@match), notice: 'Parabéns, você formou um match.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def dislike
    @job = Job.find(params[:job_id])
    match = Match.find(params[:match])
    if match.update(dislike: true)
      redirect_to job_path(@job), notice: 'Match atualizado com dislike.'
    else
      redirect_to job_path(@job), alert: 'Não foi possível atualizar o match com dislike.'
    end
  end



  private

  def job_params
    params.require(:job).permit(:description, :cep, :address, :city, :salary, :lat, :long, :interest_area_id)
  end
end
