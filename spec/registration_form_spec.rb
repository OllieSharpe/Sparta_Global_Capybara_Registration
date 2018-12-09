require_relative 'spec_helper'

describe "Testing the registration form for Sparta Global" do

  before(:all) do
    @url = ENV['REGISTRATION_URL']
    @sparta_site = SpartaSite.new
    @sparta_site.registration_page.visit_registration_page(@url.to_s)
  end

  it "Should accept a given first name" do
    pending
  end

  it "Should accept a given last name" do
    pending
  end

  it "Should accept a given age" do
    pending
  end

  it "Should accept a given date of birth" do
    pending
  end

  it "Should accept one of either male or female" do
    pending
  end

  it "Should accept a degree title" do
    pending
  end

  it "Should accept select the correct university from the dropdown box" do
    pending
  end
  
  it "should be able to input the address in the address field" do
    pending
  end

  it "should be able to input the optional address 2 in the address 2 field" do
    pending
  end

  it "should be able to input a city in the city field" do
    pending
  end

  it "should be able to select a county from the dropdown menu" do
    pending
  end

  it "should be able to input a postcode in the postcode field" do
    pending
  end

  it "should be able to input an email in the email field" do
    pending
  end

  it "should be able to input skills in the text area" do
    pending
  end
  
  it "should land on registration page" do
    pending
  end

  it "should be 11 characters long and accept only numbers for the phone number" do
    pending
  end

  it "should accept a web link for linkedIn URL" do
    pending
  end

  it "should upload cv document" do
    pending
  end

  it "should select either SDET or DEVOPS for stream" do
    pending
  end

  it "should have terms and conditions selected" do 
    pending
  end

  it 'should accept an integer between 1 and 100 inclusive for the rating' do
    pending
  end


end
