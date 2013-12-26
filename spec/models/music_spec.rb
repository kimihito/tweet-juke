require 'spec_helper'

describe Music do
  describe "validates presence" do
    it "has error_on titile" do 
      subject.should have(1).error_on(:title)
      subject.should_not be_valid
    end
    it "has error_on url" do
      subject.should have(1).error_on(:url)
      subject.should_not be_valid
    end 
  end

  describe "validates :music_url" do
    context "url invalid data" do
      before(:each) do
        @user = create(:invalid_url)
      end
      it "does not save invalid content" do
        pending "fooo"
      end
    end
    context "url valid data" do
      before(:each) do
        @user = create(:valid_url)
      end
      it "saves valid data" do
        pending "foo"
      end 
    end
  end

end
