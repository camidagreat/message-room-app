class User < ApplicationRecord

  has_many :messages
  has_many :subscriptions
  has_many :message_rooms, through: :subscriptions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:username]

  validates_uniqueness_of :username

  def email_required?
   false
  end

  def email_changed?
   false
  end

  # use this instead of email_changed? for Rails = 5.1.x
  def will_save_change_to_email?
   false
  end

  def initials
    return first_name[0,1].capitalize + last_name[0,1].capitalize
  end
end
