class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to user
    else
      flash[:center] = "Sign in failed!"
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
