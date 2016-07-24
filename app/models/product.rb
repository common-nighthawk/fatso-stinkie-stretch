class Product < ActiveRecord::Base
  has_many :inventories

  validates :name, presence: true
  validates :name, uniqueness: true
end
