class Warehouse < ActiveRecord::Base
  has_many :shipments
end
