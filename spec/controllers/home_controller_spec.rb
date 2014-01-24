require 'spec_helper'

describe HomeController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "POST 'create'" do
    let(:music){ create(:valid_url) }
    context "with valid attributes" do
      it "saves the new music in the database" do
      end
      it "renders nothing true" do
        pending "hoge"
      end
      it "saves the new user in the database" do
        pending "hooo"
      end
    end
    context "with invalid attributes" do
      it "does not save the new music in the database" do
        pending "hooo"
      end
      it "does not save the new user in the database" do
        pending "hooo"
      end
    end
  end

end
