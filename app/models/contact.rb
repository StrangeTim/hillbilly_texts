class Contact < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :messages

  def full_name
    return self.first_name + " " + self.last_name
  end
end
