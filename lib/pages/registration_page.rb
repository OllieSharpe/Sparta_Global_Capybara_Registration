require 'Capybara/dsl'

class Registration

  include Capybara::DSL

  attr_reader :linkedin_name

  def initialize
    @phone_number = "0#{rand(7000000000..7999999999)}"
    @linkedin_name = ["rubenpinto","oliversharpe","keeratlalia"].sample
  end

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

  def visit_registration_page(url)
    visit(url)
  end

  def input_address
    fill_in(ADDRESS, :with => '19 North Park')
  end

  def get_address_value
    find_field(ADDRESS).value
  end

  def input_optional_address
    fill_in(ADDRESS2, :with => '2 Albany Road')
  end

  def get_address2_value
    find_field(ADDRESS2).value
  end

  def input_city
    fill_in(CITY, :with => 'London')
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
    fill_in(POSTCODE, :with => 'SL0 9DH')
  end

  def get_postcode_value
    find_field(POSTCODE).value
  end

  def input_email
    find("input[type='email']").set "k@hotmail.com"
  end

  def get_email_value
    find("input[type='email']").value
  end

  def input_skills
    fill_in(SKILLS, :with => 'Interpersonal, Problem solving, Dancing')
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
    find("input[name='cv']").value
  end

  def upload_cv_document
    find("input[name='cv']").send_keys('C:\Users\TECH-W100\Desktop\istqb.pdf')
  end

end
