class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
=begin
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
=end
  has_secure_password
  before_validation :assign_role
  belongs_to :role
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  def assign_role
    self.role = Role.find_by name: 'Regular' if role.nil?
  end

  def admin?
    role.name == 'Admin'
  end
end
