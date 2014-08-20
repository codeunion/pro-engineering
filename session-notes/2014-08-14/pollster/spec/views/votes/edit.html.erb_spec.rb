require 'rails_helper'

RSpec.describe "votes/edit", :type => :view do
  before(:each) do
    @vote = assign(:vote, Vote.create!())
  end

  it "renders the edit vote form" do
    render

    assert_select "form[action=?][method=?]", vote_path(@vote), "post" do
    end
  end
end
