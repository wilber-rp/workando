class RegistrationsController < Devise::RegistrationsController
  def create
    interest_areas = sign_up_params["interest_area_ids"].reject!(&:empty?)
    build_resource(sign_up_params.except(:interest_area_ids))
    if resource.save
      interest_areas.each do |area_id|
        area = InterestArea.find(area_id.to_i)
        CandidateInterestArea.create(user: resource, interest_area_id: area.id)
      end
      sign_up(resource_name, resource)
      respond_with resource, location: after_sign_up_path_for(resource)
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

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
    params.require(:user).permit(:email, :password, :password_confirmation, :first_name, :last_name, :cpf, :company_name, :cnpj, :phone, :zip, :address, :number, :complement, :neighborhood, :city, :state, :lat, :long, :experience, interest_area_ids: [])
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :first_name, :last_name, :cpf, :company_name, :cnpj, :phone, :zip, :address, :number, :complement, :neighborhood, :city, :state, :lat, :long, :experience, candidate_interest_areas: [])
  end

end
