class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  #before_filter :authenticate, :only => [:edit,:update, :destroy]
  #before_filter :correct_user, :only => [:edit, :update, :destroy]

  def new
    @title = "Signup Page"
    @user = User.new
    end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to :action => 'index'
    else
      @title = 'Signup failed'
      flash[:center] = "Signup failed!"
      render 'new'
    end
  end

  def show
    @title = "User record"
    @user = User.find(params[:id])
  end


  def index
    @title = "List of users"
    @user = User.all
  end

  def edit
    @title = "Edit user info"
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:update] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :action => 'index'
  end


  private

    def user_params
      params.require(:user).permit(:name, :textColor, :font, :password,
                                    :password_confirmation)
    end

    def signed_in_user
      unless signed_in?
        flash[:danger] = "Please log in."
        redirect_to signin_url
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end

    # def authenticate
    #   deny_access unless signed_in?
    # end

    # def correct_user
    #   @user = User.find(params[:id])
    #   redirect_to(root_path) unless current_user?(@user)
    # end

end

