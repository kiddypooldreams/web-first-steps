class User < ApplicationRecord
  has_many :notifies
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  def admin?
    role == 'admin' 
  end

  attr_accessor :telegram_id

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
