class MessagesController < ApplicationController
  before_action :signed_in_user, only: [:create]
  #before_filter :authenticate, :only => [:create]

  def create
    @message = Message.new(message_params)
    this_user = User.find_by_name current_user.name
    @message.user_id = this_user.id
    @message.topic_id = flash[:topic_id]

    if @message.save
      redirect_to :action => 'index'
    else
      flash[:messageFlash] = "Message didn't post!"
      render 'index'
    end
  end

  def index
    @title = "Message Board"
    @message = Message.all # :order => "created_at DESC",
               # :limit => 50
    @form_heading = "Write post"
    @new_message = Message.new
    @user = User.all
    @topic_list = Topic.all #, :order => "created_at DESC",
        #      :limit => 15
  end

  private

    def message_params
      params.require(:message).permit(:content, :user_id, :topic_id)
    end
    # def authenticate
    #   deny_access unless signed_in?
    # end
end
