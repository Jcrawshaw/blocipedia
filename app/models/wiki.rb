class Wiki < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  default_scope { order('created_at DESC') }
  #scope :public_only, -> { where( private: nil) }
  scope :public_only, -> { where private: [nil, false] }
  scope :private_only, -> { where private: true }
end
