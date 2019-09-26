class User < ApplicationRecord

  has_many :messages
  has_many :subscriptions
  has_many :message_rooms, through: :subscriptions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:username]

  validates_uniqueness_of :username

  validates_presence_of :email, :username, :password

  def email_required?
   false
  end

  def email_changed?
   false
  end

  def initials
    return first_name[0,1].capitalize + last_name[0,1].capitalize
  end
end
