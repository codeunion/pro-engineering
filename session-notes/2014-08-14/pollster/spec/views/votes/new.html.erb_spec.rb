require 'rails_helper'

RSpec.describe "votes/new", :type => :view do
  before(:each) do
    assign(:vote, Vote.new())
  end

  it "renders new vote form" do
    render

    assert_select "form[action=?][method=?]", votes_path, "post" do
    end
  end
end
