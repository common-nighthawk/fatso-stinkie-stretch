class RetailStore < ActiveRecord::Base
  has_many :users, as: :location
end
