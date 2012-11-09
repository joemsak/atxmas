class Address < ActiveRecord::Base
  scope :private_entries, where(:visibility => 'private')
  scope :public_entries,  where(:visibility => 'public')
  default_scope public_entries

  attr_accessible :city, :country_id, :postal_code, :region_id, :visibility, :street, :user_id

  def private?
    visibility == 'private'
  end

  private
  def populate_with_current_scope_attributes
    return unless self.class.scope_attributes?
    modified_scope_attrs = self.class.scope_attributes.reject { |k, _| k == :visibility }

    modified_scope_attrs.each do |att,value|
      send("#{att}=", value) if respond_to?("#{att}=")
    end
  end
end
