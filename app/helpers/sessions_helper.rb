module SessionsHelper

  # Logs in the given user.
  def sign_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

  # Returns true if the given user is the current user.
  def current_user?(user)
    user && user == current_user
  end

  #Returns true if the user is logged in, false otherwise.
  def signed_in?
    !current_user.nil?
  end

  # Signs out the current user.
  def sign_out
    session.delete(:user_id)
    @current_user = nil
  end

end
