class OauthController < ApplicationController
  def facebook
    omniauth = request.env["omniauth.auth"]
    session[:user_id] = omniauth[:uid]
    session[:user_email] = omniauth[:info][:email]
    redirect_to "/admin"
  end

  def logout
    session[:user_id] = nil
    session[:user_email] = nil
    redirect_to "/"
  end
end
