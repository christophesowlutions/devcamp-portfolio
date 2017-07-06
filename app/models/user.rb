class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable --> When a user signs up, they need to confirm their email.
  # :lockable --> Lock a user out when they try to sign in unsuccessfully several times
  # :timeoutable --> Make the session timeout, meaning, sign them out after X amount of time of inactivity
  # :omniauthable --> Third party log-ins (Sign in via Facebook)
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
