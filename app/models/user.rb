class User < ActiveRecord::Base
  belongs_to :location, polymorphic: true

  validates :email, presence: true
  validates :name, presence: true
  validates :type, presence: true
  validates :email, uniqueness: true
end
