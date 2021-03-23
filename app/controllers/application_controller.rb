class ApplicationController < ActionController::Base
  include SessionsHelper

  private   

  def signed_in_user
      unless signed_in?
        flash[:danger] = "Please log in."
        redirect_to signin_url
      end
    end

end
