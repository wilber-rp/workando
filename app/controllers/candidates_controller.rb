class CandidatesController < ApplicationController



  def show
    @candidate = current_user.candidate
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = Candidate.new(cadidate_params)
    @candidate.user = current_user

    if @candidate.save!
      redirect_to candidate_path(@candidate), notice: "Candidato criado com sucesso"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @candidate = current_user.candidate
  end

  def update
    @candidate = current_user.candidate

    if @candidate.update(candidate_params)
      redirect_to @candidate, notice: 'Perfil do candidato atualizado com sucesso.'
    else
      render :edit
    end
  end


  private



  def cadidate_params
    params.require(:candidate).permit(:first_name, :last_name, :cpf, :phone, :address, :experience)
  end


end
