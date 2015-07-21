class Message < ActiveRecord::Base
  has_and_belongs_to_many :contacts
  belongs_to :user


  def send_recipients(recipients, text, user_phone)
    recipients.each do |recipient|

      if recipient != ""
        phone_number = Contact.find(recipient).phone_number
        send_message(user_phone, text, phone_number)
      end
    end
  end

  def auto_reply(to_number, text, from_number)
    send_message(from_number, text, to_number)
  end

  private

    def send_message(current_user_phone, text, to_phone_number)
      begin
        response = RestClient::Request.new(
          :method => :post,
          :url => "https://api.twilio.com/2010-04-01/Accounts/#{ENV['TWILIO_ACCOUNT_SID']}/Messages.json",
          :user => ENV['TWILIO_ACCOUNT_SID'],
          :password => ENV['TWILIO_AUTH_TOKEN'],
          :payload => { :Body => text,
                        :To => to_phone_number,
                        :From => current_user_phone }

        )
        response.execute
      rescue RestClient::BadRequest => error
        message = JSON.parse(error.response)['message']
        errors.add(:base, message)
        false
      end
    end


end
