require 'rails_helper'

RSpec.describe "votes/index", :type => :view do
  before(:each) do
    assign(:votes, [
      Vote.create!(),
      Vote.create!()
    ])
  end

  it "renders a list of votes" do
    render
  end
end
