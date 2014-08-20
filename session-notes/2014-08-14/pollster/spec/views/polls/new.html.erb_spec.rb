require 'rails_helper'

RSpec.describe "polls/new", :type => :view do
  before(:each) do
    assign(:poll, Poll.new())
  end

  it "renders new poll form" do
    render

    assert_select "form[action=?][method=?]", polls_path, "post" do
    end
  end
end
