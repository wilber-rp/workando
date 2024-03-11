class CandidatesController < ApplicationController
  def index
    @candidates = Candidate.all
  end

  def show
    @candidate = current_user.candidate
  end

  def new
    @candidate = Candidate.new
    @interest_areas = InterestArea.all
  end

  def create
    @candidate = Candidate.new(cadidate_params)
    @candidate.user = current_user

    interest_areas = params[:candidate][:candidate_interest_areas]
    interest_areas.shift
    interest_areas.each do |area_id|
      area = InterestArea.find(area_id.to_i)
      CandidateInterestArea.create(candidate: @candidate, interest_area: area)
    end

    base_url = "https://cep.awesomeapi.com.br/json/#{@candidate.cep}"
    cep_data = URI.open(base_url).read
    cep = JSON.parse(cep_data)
    @candidate.long = cep['lng']
    @candidate.lat = cep['lat']

    if @candidate.save
      redirect_to candidate_path(@candidate), notice: 'Candidato criado com sucesso'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @candidate = current_user.candidate
    @interest_areas = InterestArea.all
  end

  def update
    @candidate = Candidate.find(params[:id])

    if @candidate.user == current_user
      if @candidate.update(cadidate_params)
        redirect_to candidate_path(@candidate)
      else
        render :edit
      end
    end
  end

  private

  def cadidate_params
    params.require(:candidate).permit(:first_name, :last_name, :cpf, :phone, :cep, :address, :city, :experience, interest_area_ids: [])
  end
end
