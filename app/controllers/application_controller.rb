class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  #allow_browser versions: :modern
  allow_browser versions: { safari: 16.4, firefox: 121, ie: false }

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  helper_method :current_user

  def current_user
    @current_user ||= Current.session&.user
  end

  private
    def record_not_found
      render plain: "Record Not Found", status: 404
    end
end
