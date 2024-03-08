class CandidatesController < ApplicationController



  def show
    @Candidate = current_user.candidate
  end

  def new
    @candidate = Candidate.new
  end

  def create
    @candidate = current_user.build_candidate(cadidate_params)

    if @candidate.save
      redirect_to candidate_path, notice: "Candidato criado com sucesso"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private



  def cadidate_params
    params.require(:candidate).permit(:first_name, :last_name, :cpf, :phone, :address)
  end
end
