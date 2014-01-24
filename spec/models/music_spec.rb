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
      before do
        @music = FactoryGirl.create(:invalid_url)
        @music.save
      end
      it "does not save invalid content" do
        @music.should_not be_valid
      end
    end
    context "url valid data" do
      before do
        @music = create(:valid_url)
        @music.save
      end
      it "saves valid data" do
        @music.should be_valid
      end
    end
  end

end
