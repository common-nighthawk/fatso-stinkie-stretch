class Retail < ActiveRecord::Base
  has_many :users, as: :location
end
