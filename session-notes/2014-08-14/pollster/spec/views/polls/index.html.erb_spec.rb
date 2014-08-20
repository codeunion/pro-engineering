require 'rails_helper'

RSpec.describe "polls/index", :type => :view do
  before(:each) do
    assign(:polls, [
      Poll.create!(),
      Poll.create!()
    ])
  end

  it "renders a list of polls" do
    render
  end
end
