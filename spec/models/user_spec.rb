require 'rails_helper'

RSpec.describe User, :type => :model do
  describe "roles" do
    let(:user) { FactoryGirl.build :user }

    it "defaults to standard role" do
      expect(user).to be_valid
      expect(user.role).to eql 'standard'
    end

    it "can be set to admin" do
      user.role = 'admin'
      expect(user.role).to eql 'admin'
    end

    it "can be set to premium" do
      user.role = 'premium'
      expect(user.role).to eql 'premium'
    end

    it "cannot be set to junk" do
      user.role = 'junk'
      expect(user).to_not be_valid # expect(user.valid?).to eql true
    end

  end
end
