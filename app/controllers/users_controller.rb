class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_contacts = @user.contacts
    @user_messages = @user.messages
    @user_sent = []
    @user_messages.each do |message|
      if message.reply == false
        @user_sent.push(message)
      end
    end

    @user_replies = []
    @user_messages.each do |message|
      if message.reply == true
        @user_replies.push(message)
      end
    end

    @contact = Contact.new
  end

end
