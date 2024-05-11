class RegistrationsController < Devise::RegistrationsController

  def create
    build_resource(sign_up_params.delete(:candidate_interest_areas))
    interest_areas = sign_up_params.delete(:candidate_interest_areas)
    if resource.save
      interest_areas.reject(&:empty?).each do |area_id|
        area = InterestArea.find(area_id.to_i)
        CandidateInterestArea.create(user: resource, interest_area: area)
      end
      sign_up(resource_name, resource)
      respond_with resource, location: after_sign_up_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
    raise
  end


  # def create
  #   filtered_params = sign_up_params
  #   interest_areas = filtered_params[:candidate_interest_areas]
  #   interest_areas.shift



  #   interest_areas.each do |area_id|
  #     area = InterestArea.find(area_id.to_i)
  #     CandidateInterestArea.create(user: current_user, interest_area: area)
  #   end



  #   raise

  #     interest_areas = params[:candidate][:candidate_interest_areas]


  #     if @candidate.save
  #       current_user.save
  #       redirect_to candidate_path(@candidate), notice: 'Candidato criado com sucesso'
  #     else
  #       render :new, status: :unprocessable_entity
  #     end



  # end

  def update
    filtered_params = account_update_params
    interest_areas = filtered_params[:candidate_interest_areas]
    interest_areas.shift
    if interest_areas.empty?
      current_user.candidate_interest_areas.destroy_all
    else
      interest_areas.each do |area_id|
        current_user.candidate_interest_areas.destroy_all
        area = InterestArea.find(area_id.to_i)
        CandidateInterestArea.create(user: current_user, interest_area: area)
      end
    end

    if current_user.update(filtered_params.except(:candidate_interest_areas))
    else
      render :edit
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :cpf, :company_name, :cnpj, :phone, :zip, :address, :number, :complement, :neighborhood, :city, :state, :lat, :long, :experience, candidate_interest_areas: [])
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :first_name, :last_name, :cpf, :company_name, :cnpj, :phone, :zip, :address, :number, :complement, :neighborhood, :city, :state, :lat, :long, :experience, candidate_interest_areas: [])
  end

end
