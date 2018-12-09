require 'Capybara/dsl'

class Registration

  include Capybara::DSL

  attr_reader :first_name, :last_name, :age, :date_of_birth, :university, :degree, :university_locator, :address, :address2, :city, :postcode, :email, :skills, :linkedin_name

  def initialize
    @first_name = 'The Nefarious'
    @last_name = 'Mr. Dark'
    @age = "1000"
    @date_of_birth = '25121018'
    @university = 'University of Oxford'
    @degree = 'PhD Dark Lord Sorceries'
    @address ='19 North Park'
    @address2 ='2 Albany Road'
    @city = 'London'
    @postcode ='SL0 9DH'
    @email = 'k@hotmail.com'
    @skills ='Interpersonal, Problem solving, Dancing'
    @phone_number = "0#{rand(7000000000..7999999999)}"
    @linkedin_name = ["rubenpinto","oliversharpe","keeratlalia"].sample
  end

  FIRST_NAME_ID = 'firstName'
  LAST_NAME_ID = 'lastName'
  FIRST_NAME_LOCATOR = 'input[id="firstName"]'
  LAST_NAME_LOCATOR = 'input[id=lastName]'
  AGE_LOCATOR = 'input[type="number"]'
  DOB_LOCATOR = 'input[name="dob"]'
  MALE_GENDER_LOCATOR = 'label[for="customRadioInline1"]'
  FEMALE_GENDER_LOCATOR = 'label[for="customRadioInline2"]'
  MALE_GENDER_ID = 'input[id="customRadioInline1"]'
  FEMALE_GENDER_ID = 'input[id="customRadioInline2"]'
  DEGREE_LOCATOR = 'input[placeholder="Enter Degree"]'
  UNIVERSITY_DROPDOWN_ID = '#inputUni'
  UNIVERSITY_LOCATOR = 'inputUni'
  ADDRESS = 'inputAddress'
  ADDRESS2 = 'inputAddress2'
  CITY = 'inputCity'
  POSTCODE = 'inputPostcode'
  SKILLS = 'exampleFormControlTextarea1'
  COUNTY = 'inputCounty'
  PHONE_NUMBER_INPUT_TYPE = 'tel'
  LINKEDIN_INPUT_TYPE = 'url'
  STREAM_SDET_LABEL = 'streamRadioInline1'
  TERMS_AND_CONDITIONS_ID = 'terms'
  RATE_EXPERIENCE_SLIDER_ID = 'value_for_slider'
  UPLOAD_CV_NAME = 'cv'
  SUBMIT_BUTTON_TYPE = 'submit'

  def visit_registration_page(url)
    visit(url)
  end

  def enter_first_name
    fill_in(FIRST_NAME_ID, :with => @first_name)
  end

  def get_first_name
    find(FIRST_NAME_LOCATOR)['value']
  end

  def enter_last_name
    fill_in(LAST_NAME_ID, :with => @last_name)
  end

  def get_last_name
    find(LAST_NAME_LOCATOR)['value']
  end

  def enter_age
    find(AGE_LOCATOR).send_keys(@age)
  end

  def get_age
    find(AGE_LOCATOR)['value']
  end

  def select_male
    find(MALE_GENDER_LOCATOR).click
  end

  def male_selected?
    find(MALE_GENDER_ID).selected?
  end

  def select_female
    find(FEMALE_GENDER_LOCATOR).click
  end

  def female_selected?
    find(FEMALE_GENDER_ID).selected?
  end

  def enter_date_of_birth
    find(DOB_LOCATOR).send_keys(@date_of_birth)
  end

  def get_date_of_birth
    find(DOB_LOCATOR)['value']
  end

  def enter_degree
    find(DEGREE_LOCATOR).send_keys(@degree)
  end

  def get_degree
    find(DEGREE_LOCATOR)['value']
  end

  def select_university
    select(@university, :from => UNIVERSITY_LOCATOR)
  end

  def get_university
    find(UNIVERSITY_DROPDOWN_ID).value
  end

  def convert_date(date)
    date_array = date.split('-')
    date_array.reverse!
    date_array.join
  end

  def input_address
    fill_in(ADDRESS, :with => @address)
  end

  def get_address_value
    find_field(ADDRESS).value
  end

  def input_optional_address
    fill_in(ADDRESS2, :with => @address2)
  end

  def get_address2_value
    find_field(ADDRESS2).value
  end

  def input_city
    fill_in(CITY, :with => @city)
  end

  def get_city_value
    find_field(CITY).value
  end

  def select_county
    select "Bristol", :from => "inputCounty"
  end

  def get_county_value
    find_field(COUNTY).text.include?('Bristol')
  end

  def input_postcode
    fill_in(POSTCODE, :with => @postcode)
  end

  def get_postcode_value
    find_field(POSTCODE).value
  end

  def input_email
    find("input[type='email']").set @email
  end

  def get_email_value
    find("input[type='email']").value
  end

  def input_skills
    fill_in(SKILLS, :with => @skills)
  end

  def get_skills_value
    find_field(SKILLS).value
  end

  # obtains the current url of the registration page
  def current_url
    page.current_url
  end

  # inputs a phone number in the phone number field
  def input_phone_number
    find("input[type='#{PHONE_NUMBER_INPUT_TYPE}']").set("#{@phone_number}")
  end

  # obtains the id of the phone number input field
  def get_phone_number_field
    find("input[type='#{PHONE_NUMBER_INPUT_TYPE}']").value
  end

  #inputs the linkedin url
  def input_linkedin
    find("input[type='#{LINKEDIN_INPUT_TYPE}']").set("https://www.linkedin.com/in/#{@linkedin_name}")
  end

  def get_linkedin_field
    find("input[type='#{LINKEDIN_INPUT_TYPE}']").value
  end

  # clicks on SDET radio button
  def select_sdet_stream
    find("label[for='#{STREAM_SDET_LABEL}']").click
  end

  # checks if SDET is selected
  def is_sdet_clicked
    find("input[id='#{STREAM_SDET_LABEL}']").selected?
  end

  # selects the terms and conditions box
  def check_terms_and_conditions
    find("input[id='#{TERMS_AND_CONDITIONS_ID}']").click
  end

  # checks if the terms and conditions checkbox is selected
  def is_terms_and_conditions_clicked
    find("input[id='#{TERMS_AND_CONDITIONS_ID}']").selected?
  end

  #obtain the rating experience value
  def get_rating_experience
    find("span[id='#{RATE_EXPERIENCE_SLIDER_ID}']").text
  end

  def get_cv
    find("input[name='#{UPLOAD_CV_NAME}']").value
  end

  def upload_cv_document
    find("input[name='#{UPLOAD_CV_NAME}']").send_keys('C:\Users\TECH-W100\Desktop\istqb.pdf')
  end

  def find_submit_button
    find("button[type='#{SUBMIT_BUTTON_TYPE}']")
  end

  def submit_form
    find("button[type='#{SUBMIT_BUTTON_TYPE}']").click
  end
end
