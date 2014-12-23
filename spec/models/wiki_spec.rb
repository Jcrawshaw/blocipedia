require 'rails_helper'

RSpec.describe Wiki, :type => :model do
  let(:wiki) {FactoryGirl.create :wiki}

  it "must have a title" do
    expect(wiki).to be_valid

    wiki.title = ''
    expect(wiki).to_not be_valid
  end

end
