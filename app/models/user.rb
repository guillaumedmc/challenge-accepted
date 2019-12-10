class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable , :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  mount_uploader :photo, PhotoUploader

  has_many :challenges
  has_many :participants
end
