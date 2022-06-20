class ApplicationController < ActionController::Base
  # Uncomment this #before_action to see the progress bar long enough
  # and remove it when it has the expected styles
  # before_action -> { sleep 3 }

  before_action :authenticate_user!, unless: :devise_controller?

  private

  def current_company
    @current_company ||= current_user.company if user_signed_in?
  end

  helper_method :current_company
end
