require_relative 'spec_helper'

describe "Testing the registration form for Sparta Global" do

  before(:all) do
    @url = ENV['REGISTRATION_URL']
    @sparta_site = SpartaSite.new
    @sparta_site.registration_page.visit_registration_page(@url.to_s)
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

end
