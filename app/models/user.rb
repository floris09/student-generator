class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true
  validates :last_name, presence: true

  def admin?
    self.admin == true
  end

  def not_admin?
    self.admin == false
  end

  def self.order_by_admin
    order(admin: :desc)
  end

  def full_name
    "#{first_name} #{last_name}"
  end

end
