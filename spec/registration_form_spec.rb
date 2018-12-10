require_relative 'spec_helper'

describe "Testing the registration form for Sparta Global" do

  before(:all) do
    @url = ENV['REGISTRATION_URL']
    @sparta_site = SpartaSite.new
    @registration_page = @sparta_site.registration_page
    @confirmation_page = @sparta_site.confirmation_page
  end
     
  it "should land on registration page" do
    @registration_page.visit_registration_page(@url.to_s)
    expect(@registration_page.current_url).to eq @url
  end

  it "Should accept a given first name" do
    @sparta_site.registration_page.enter_first_name
    expect(@sparta_site.registration_page.get_first_name).to eq @sparta_site.registration_page.first_name
  end

  it "Should accept a given last name" do
    @sparta_site.registration_page.enter_last_name
    expect(@sparta_site.registration_page.get_last_name).to eq @sparta_site.registration_page.last_name
  end

  it "Should accept a given age" do
    @sparta_site.registration_page.enter_age
    expect(@sparta_site.registration_page.get_age).to eq @sparta_site.registration_page.age
  end

  it "Should accept a given date of birth" do
    @sparta_site.registration_page.enter_date_of_birth
    expect(@sparta_site.registration_page.convert_date(@sparta_site.registration_page.get_date_of_birth)).to eq @sparta_site.registration_page.date_of_birth
  end

  it "Should accept one of either male or female" do
    @sparta_site.registration_page.select_female
    expect(@sparta_site.registration_page.female_selected?).to eq true
    @sparta_site.registration_page.select_male
    expect(@sparta_site.registration_page.male_selected?).to eq true
    expect(@sparta_site.registration_page.female_selected?).to eq false
  end

  it "Should accept a degree title" do
    @sparta_site.registration_page.enter_degree
    expect(@sparta_site.registration_page.get_degree).to eq @sparta_site.registration_page.degree
  end

  it "Should accept select the correct university from the dropdown box" do
    @sparta_site.registration_page.select_university
    expect(@sparta_site.registration_page.get_university).to eq @sparta_site.registration_page.university
  end

  it "should be able to input the address in the address field" do
    @sparta_site.registration_page.input_address
    expect(@sparta_site.registration_page.get_address_value).to eq '19 North Park'
  end

  it "should be able to input the optional address 2 in the address 2 field" do
    @sparta_site.registration_page.input_optional_address
    expect(@sparta_site.registration_page.get_address2_value).to eq '2 Albany Road'
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

  it "should have terms and conditions selected" do
    @registration_page.check_terms_and_conditions
    expect(@registration_page.is_terms_and_conditions_clicked).to be true
  end

  it 'should accept an integer between 1 and 100 inclusive' do
    @registration_page.get_rating_experience
    expect(@registration_page.get_rating_experience.to_i).to be_between(1, 100)
  end

  it 'should submit the form if all fields are filled out' do
    @registration_page.submit_form
    expect(@confirmation_page.current_url).to start_with("#{@confirmation_page.registration_completed_url}")
    expect(@confirmation_page.get_confirmation_message).to eq @confirmation_page.confirmation_message
  end

  after(:all) do
    sleep 2
  end

end
