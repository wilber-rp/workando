class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :dispatch_user

  def dispatch_user
    return unless current_user && request.get?

    path = new_candidate_path if current_user.role_candidate? && current_user.candidate.blank?
    path = new_company_path if current_user.role_company? && current_user.company.blank?

    puts path

    redirect_to path unless path.nil? || path == request.path
  end

  # def after_sign_path_for(resource)
  #   stored_location_for(resource) || welcome_path
  # end
  # metodo para sobrescrever o caminho depois do login, queremos jogar o candidato para os jobs.

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
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
