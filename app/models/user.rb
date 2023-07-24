class User < ApplicationRecord
  has_many :images, as: :imageable
  has_many :applications

  attribute :experience, :text

  def admin?
    is_admin
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
