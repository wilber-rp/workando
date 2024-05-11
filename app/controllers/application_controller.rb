class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # def after_sign_path_for(resource)
  #   stored_location_for(resource) || welcome_path
  # end
  # metodo para sobrescrever o caminho depois do login, queremos jogar o candidato para os jobs.

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :cpf, :company_name, :cnpj, :phone, :zip, :address, :number, :complement, :neighborhood, :city, :state, :lat, :long, :experience, candidate_interest_areas_attributes: [:interest_area_id]])

    devise_parameter_sanitizer.permit(:account_update, keys: [:current_password, :phone, :zip, :address, :number, :complement, :neighborhood, :city, :state, :lat, :long, :experience, candidate_interest_areas: []])
  end
  # include Pundit::Authorization

  # Pundit: allow-list approach
  # after_action :verify_authorized, except: :index, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end
end
