require_relative 'spec_helper'

describe "Testing the registration form for Sparta Global" do

  before(:all) do
    @url = ENV['REGISTRATION_URL']
    @sparta_site = SpartaSite.new
    @sparta_site.registration_page.visit_registration_page(@url.to_s)
  end

  it "should land on registration page" do
    pending
  end

  it "should be 11 characters long and accept only numbers" do
    pending
  end

  it "should accept a web link" do

  end

  it "should upload cv document" do

  end

  it "should select either SDET or DEVOPS for stream" do

  end

  it "should have terms and conditions selected" do 

  end

  it 'should accept an integer between 1 and 100 inclusive' do

  end


end
