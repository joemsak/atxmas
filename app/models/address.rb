class Address < ActiveRecord::Base
  default_scope where(:state => 'public')

  scope :private_entries, where(:state => 'private')
  scope :public_entries,  where(:state => 'public')

  attr_accessible :city, :country_id, :postal_code, :region_id, :state, :street, :user_id
end
