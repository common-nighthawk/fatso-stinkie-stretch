class User < ActiveRecord::Base
  belongs_to :location, polymorphic: true
end
