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
    @registration_page.upload_cv_document
    expect(@registration_page.get_cv).not_to eq "No file chosen"
    expect(@registration_page.get_cv).to end_with(".docx").or end_with(".pdf")
  end

  it "should select either SDET or DEVOPS for stream" do
    @registration_page.select_sdet_stream
    expect(@registration_page.is_sdet_clicked).to be true
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
    @sparta_site.registration_page.input_address
    expect(@sparta_site.registration_page.get_address_value).to eq '19 North Park'
  end


  it "should be able to input the optional address 2 in the address 2 field" do
    @sparta_site.registration_page.input_optional_address
    expect(@sparta_site.registration_page.get_address2_value).to eq '2 Albany Road'
  end


  it "should have terms and conditions selected" do 
    @registration_page.check_terms_and_conditions
    expect(@registration_page.is_terms_and_conditions_clicked).to be true
  end

  it 'should accept an integer between 1 and 100 inclusive' do
    @registration_page.get_rating_experience
    expect(@registration_page.get_rating_experience.to_i).to be_between(1, 100)
    sleep 2
  end

  it "should be able to input a city in the city field" do
    @sparta_site.registration_page.input_city
    expect(@sparta_site.registration_page.get_city_value).to eq 'London'
  end

  it "should be able to select a county from the dropdown menu" do
    @sparta_site.registration_page.select_county
    expect(@sparta_site.registration_page.get_county_value).to be true
  end

  it "should be able to input a postcode in the postcode field" do
    @sparta_site.registration_page.input_postcode
    expect(@sparta_site.registration_page.get_postcode_value).to eq 'SL0 9DH'
  end

  it "should be able to input an email in the email field" do
    @sparta_site.registration_page.input_email
    expect(@sparta_site.registration_page.get_email_value).to eq 'k@hotmail.com'
  end

  it "should be able to input skills in the text area" do
    @sparta_site.registration_page.input_skills
    expect(@sparta_site.registration_page.get_skills_value).to eq 'Interpersonal, Problem solving, Dancing'
    sleep 2
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
