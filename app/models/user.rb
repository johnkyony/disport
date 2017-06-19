# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string
#  token                  :string
#  uid                    :string
#  avatar                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  latitude               :float
#  longitude              :float
#  location               :string
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable , :omniauthable, :omniauth_providers => [:facebook]
         
 
  
  
  def self.create_from_omniauth(params , ip_address , user_location)
    user = find_or_create_by(email: params.info.email , uid: params.uid)
    user.password = Devise.friendly_token[0,20]
    user.current_sign_in_ip = ip_address
    user.location = user_location
    user.update({
      token: params.credentials.token , 
      name: params.info.name , 
      avatar: params.info.image
    })
    user
    
  end       
         
end
