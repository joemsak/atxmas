class Address < ActiveRecord::Base
  default_scope where(:visibility => 'public')

  scope :private_entries, where(:visibility => 'private')
  scope :public_entries,  where(:visibility => 'public')

  attr_accessible :city, :country_id, :postal_code, :region_id, :visibility, :street, :user_id
end
