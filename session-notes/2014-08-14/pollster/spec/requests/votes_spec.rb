require 'rails_helper'

RSpec.describe "Votes", :type => :request do
  describe "GET /votes" do
    it "works! (now write some real specs)" do
      get votes_path
      expect(response.status).to be(200)
    end
  end
end
