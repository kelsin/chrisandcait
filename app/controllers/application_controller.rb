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
        authenticate_or_request_with_http_basic "Chris and Cait Admin" do |id, password|
            id == "kelsin" && password == "kelsey"
        end
    end
end