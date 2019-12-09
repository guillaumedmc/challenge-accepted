class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable , :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable
  mount_uploader :photo, PhotoUploader

  has_and_belongs_to_many :challenges
end
