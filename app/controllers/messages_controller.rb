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
    @message.user_id = current_user.id
    @message.send_recipients(params[:message][:contact_ids],params[:message][:text],current_user.phone_number)

    if @message.save
      flash[:notice] = "You have successfully added a message."
      redirect_to :back
    else
      flash[:alert] ="There was an error with your submission."
      redirect_to :back
    end
  end

  def inbound_message
    @message = Message.new
    reply = "This number does not accept replies."
    from = params[:From]
    from = from.slice(2, 10)
    @message.auto_reply(from, reply, "6267738675")
    redirect_to 'home#index'
  end

  private
  def message_params
    params.require(:message).permit(:text, {:contact_ids => []}, :user_id)
  end

end
