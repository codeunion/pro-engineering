require 'rails_helper'

RSpec.describe "votes/show", :type => :view do
  before(:each) do
    @vote = assign(:vote, Vote.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
