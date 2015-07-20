class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def show
    @user = User.find(params[:id])
    @user_contacts = @user.contacts
  end

  def new
    @contact = Contact.new
  end

  def create
    @user = User.find(current_user.id)
    @contact = @user.contacts.new(contact_params)
    if @contact.save
      flash[:notice] = "You have successfully added a contact."
      redirect_to user_path(@user)
    else
      flash[:alert] ="There was an error with your submission."
      redirect_to :back
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @contact = Contact.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      flash[:notice] = "You have successfully updated your contact."
    else
      flash[:alert] ="There was an error with your submission."
    end
    redirect_to user_path(@user)
  end


  def destroy
    @user = User.find(params[:id])
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to user_path(@user)
  end

  private
  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :phone_number, {:contact_ids => []}, :user_id)
  end

end
