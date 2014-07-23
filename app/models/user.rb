class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable
       
  apply_simple_captcha
#   apply_simple_captcha :message => "The secret Image and code were different", :add_to_base => true
end