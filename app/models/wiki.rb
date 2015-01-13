class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations # eg subscriptions
  has_many :collaborators, through: :collaborations, source: :user # eg has many subscribers through subscriptions

  validates :title, presence: true
  default_scope { order('created_at DESC') }
  #scope :public_only, -> { where( private: nil) }
  scope :public_only, -> { where private: [nil, false] }
  scope :private_only, -> { where private: true }

  def public?
    !private?
  end
end
