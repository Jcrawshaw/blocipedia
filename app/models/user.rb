class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :role, inclusion: { in: %w{standard admin premium} }
  has_many :wikis
  
  def role
    self[:role] ||= 'standard'
  end

  def premium?
    role == 'premium' || role == 'admin'
  end

end
