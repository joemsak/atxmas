class Address < ActiveRecord::Base
  attr_accessible :city, :country_id, :postal_code, :region_id, :state, :street, :user_id
end
