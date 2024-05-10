class JobsController < ApplicationController
  def index
    mapbox_api_key = ENV['MAPBOX_API_KEY']
    alljobs = Job.where(interest_area_id: current_user.interest_areas)

    alljobs.each do |job|
      if job.lat != nil && job.lat != "undefined" && current_user.lat != nil && current_user.lat != "undefined"
        url = "https://api.mapbox.com/directions-matrix/v1/mapbox/driving/#{current_user.long.to_f},#{current_user.lat.to_f};#{job.long.to_f},#{job.lat.to_f}?sources=1&annotations=distance&access_token=#{mapbox_api_key}"
        json_data = URI.open(url).read
        parsed_data = JSON.parse(json_data)
        distance = (parsed_data['distances'][0][0] / 1000.0).round(1)
        existing_distance = Distance.find_by(candidate: current_user, job: job)

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
    # @jobs = Job.where(interest_area_id: current_user.interest_areas).joins(:distances).where.not(id: Match.where(current_user_id: current_user.id).pluck(:job_id)).order('distances.distance ASC')
    # @job = @jobs.first
    @jobs = Job.all
    @job = Job.last

    if @job != nil && @job.geocode != nil && @job.geocode.map != nil
      @marker = @job.geocode.map { |job| { lat: @job.lat.to_f, lng: @job.long.to_f, info_popup_html: render_to_string(partial: 'info_popup', locals: { job: @job }) } }
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
    @job.user = current_user

    if @job.save!
      redirect_to job_path(@job)
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
      redirect_to match_path(@match), notice: '🥳Parabéns! Você deu match!🥳'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def dislike
    @job = Job.find(params[:job_id])
    match = Match.find(params[:match])
    if match.update(dislike: true)
      redirect_to job_path(@job)
    else
      redirect_to job_path(@job), alert: 'Não foi possível atualizar o match com dislike.'
    end
  end



  private

  def job_params
    params.require(:job).permit(:description, :cep, :address, :number, :complement, :neighborhood, :city, :state, :salary, :lat, :long, :interest_area_id)
  end
end
