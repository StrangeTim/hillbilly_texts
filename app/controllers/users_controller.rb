class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_contacts = @user.contacts
    @contact = Contact.new
  end

end
