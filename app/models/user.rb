class User < ActiveRecord::Base
  has_many :contacts
  has_many :messages
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    return self.first_name + " " + self.last_name
  end
end
