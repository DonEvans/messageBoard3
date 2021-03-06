class MessagesController < ApplicationController
  #before_filter :authenticate, :only => [:create]

  def create
    @message = Message.new(params[:message])
    this_user = User.find_by_name current_user.name
    @message.user_id = this_user.id
    @message.topic_id = flash[:topic_id]

    if @message.save
      redirect_to :action => 'index'
    else
      flash[:messageFlash] = "Message didn't post!"
      redirect_to :action => 'index'
    end
  end

  def index
    @title = "Message Board"
    @message = Message.all # :order => "created_at DESC",
               # :limit => 50
    @form_heading = "Write post"
    @new_message = Message.new
    @user = User.all
   # @topic_list = Topic.find :all, :order => "created_at DESC",
   #            :limit => 15
  end

  private

    # def authenticate
    #   deny_access unless signed_in?
    # end
end
