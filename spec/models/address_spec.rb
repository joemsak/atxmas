require 'spec_no_rails_helper'
require './app/models/address'

describe Address do
  it "defaults visibility to private" do
    a = Address.create!
    a.should be_private
  end

  describe "scopes" do
    let!(:private) { Address.create! }

    let!(:public) { Address.create!(:visibility => 'public') }

    describe "default" do
      it "includes public addresses" do
        Address.all.should include(public)
      end

      it "does not include private addresses" do
        Address.all.should_not include(private)
      end
    end

    describe "private" do
      it "includes private addresses" do
        Address.private_entries.should include(private)
      end
    end

    describe "public" do
      it "includes public addresses" do
        Address.public_entries.should include(public)
      end

      it "does not include private addresses" do
        Address.public_entries.should_not include(private)
      end
    end
  end
end
