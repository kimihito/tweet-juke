require 'spec_helper'

describe User do
  it "must have name" do
    subject.should have(1).error_on(:name)
  end

  it "must bave image_url" do
    subject.should have(1).error_on(:image_url)
  end
end
