class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  validates :role, inclusion: { in: %w{standard admin premium} }
  has_many :wikis
  has_many :collaborations
  has_many :collab_wikis, through: :collaborations, source: :wiki
  
  def role
    self[:role] ||= 'standard'
  end

  def role?(r)
    self[:role] == r
  end

  def premium?
    role == 'premium' || role == 'admin'
  end

end
