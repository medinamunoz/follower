class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
      respond_to do |format|
        format.json { head :forbidden, content_type: 'text/html' }
        format.html { redirect_to root_url, notice: "No puede ingresar a este sitio." }
        format.js   { head :forbidden, content_type: 'text/html' }
      end
    end

end
