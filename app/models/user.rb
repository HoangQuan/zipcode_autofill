class User < ActiveRecord::Base
  attr_accessible :city, :code, :country, :name, :state
end
