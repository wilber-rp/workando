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


    if @candidate.save
      current_user.nickname = "#{@candidate.first_name} #{@candidate.last_name}"
      current_user.save
      redirect_to candidate_path(@candidate), notice: 'Candidato criado com sucesso'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @candidate = Candidate.find(params[:id])
    @interest_areas = InterestArea.all
  end

  def update
    @candidate = Candidate.find(params[:id])
    @interest_areas = InterestArea.all

    interest_areas = params[:candidate][:candidate_interest_areas]
    interest_areas.shift
    interest_areas.each do |area_id|
      @candidate.candidate_interest_areas.destroy_all
      area = InterestArea.find(area_id.to_i)
      CandidateInterestArea.create(candidate: @candidate, interest_area: area)
    end

    if @candidate.user == current_user
      if @candidate.update(cadidate_params.except(:interest_area_ids))
        redirect_to candidate_path(@candidate)
      else
        render :edit
      end
    end
  end

  private

  def cadidate_params
    params.require(:candidate).permit(:first_name, :last_name, :cpf, :phone, :cep, :address, :city, :experience, :lat, :long, :photo, interest_area_ids: [])
  end

  def update_params
    params.require(:candidate).permit(:first_name, :last_name, :cpf, :phone, :cep, :address, :city, :experience, :lat, :long, :candidate_interest_areas)
  end

end
