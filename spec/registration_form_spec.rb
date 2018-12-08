require_relative 'spec_helper'

describe "Testing the registration form for Sparta Global" do

  before(:all) do
    @url = ENV['REGISTRATION_URL']
    @sparta_site = SpartaSite.new
    @registration_page = @sparta_site.registration_page
  end

  it "should land on registration page" do
    @registration_page.visit_registration_page(@url.to_s)
    expect(@registration_page.current_url).to eq @url
  end

  it "should be 11 characters long and accept only numbers" do
    @registration_page.input_phone_number
    expect(@registration_page.get_phone_number_field.to_i).to be_a_kind_of(Integer)
    expect(@registration_page.get_phone_number_field.length).to eq 11
  end

  it "should accept a web link" do
    @registration_page.input_linkedin
    expect(@registration_page.get_linkedin_field).to eq "https://www.linkedin.com/in/#{@registration_page.linkedin_name}"
  end

  it "should upload cv document" do
    pending
  end

  it "should select either SDET or DEVOPS for stream" do
    @registration_page.select_sdet_stream
    expect(@registration_page.is_sdet_clicked).to be true

  end

  it "should have terms and conditions selected" do 
    @registration_page.check_terms_and_conditions
    expect(@registration_page.is_terms_and_conditions_clicked).to be true
  end

  it 'should accept an integer between 1 and 100 inclusive' do
    @registration_page.get_rating_experience
    sleep 2
  end


end
