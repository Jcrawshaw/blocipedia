class Wiki < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  default_scope { order('created_at DESC') }
end
