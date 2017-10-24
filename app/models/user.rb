class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    self.admin == true
  end

  def not_admin?
    self.admin == false
  end


  def to_admin
    self.admin = true
  end

  def to_student
    self.admin = false
  end

  def self.order_by_admin
    order(admin: :desc)
  end

end
