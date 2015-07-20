class MessagesController < ApplicationController

  def index
    @messages = Message.all
  end

  def show
    @user = current_user
    @messages = @user.messages
    @message_recipients = @message.contacts
  end

  def new
    @message = Message.new
  end

  def create

    @message = current_user.messages.new(message_params)
    if @message.save
      flash[:notice] = "You have successfully added a message."
      redirect_to user_path(current_user)
    else
      flash[:alert] ="There was an error with your submission."
      redirect_to :back
    end
  end

  private
  def message_params
    { text: params[:text],  }
  end

  def add_users_to_message

  end

end
