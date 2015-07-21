describe Message, :vcr => true do

  it 'adds an error if the to number is invalid' do
    message = Message.new(:body => 'hi', :to => '1111111', :from => '5039463641')
    message.save
    message.errors.messages[:base].should eq ["The 'To' number 1111111 is not a valid phone number."]
  end
  
end
