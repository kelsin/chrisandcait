# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => 'e6c87c5f6259cfbc64fe874cb077ac38'

  # See ActionController::Base for details
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password").
  # filter_parameter_logging :password

  private

  def authenticate
    if session[:user_id].nil?
      redirect_to '/auth/facebook'
    else
      emails = ENV['ADMIN_EMAILS'].split(',') rescue []
      if !emails.member?(session[:user_email])
        head :forbidden
      end
    end
  end
end
