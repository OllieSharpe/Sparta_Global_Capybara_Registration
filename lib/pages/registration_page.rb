require 'Capybara/dsl'

class Registration
  include Capybara::DSL

  attr_reader :linkedin_name

  def initialize
    @phone_number = "07778881234"
    @linkedin_name = "rubenpinto"
  end

  PHONE_NUMBER_INPUT_TYPE = 'tel'
  LINKEDIN_INPUT_TYPE = 'url'
  STREAM_SDET_LABEL = 'streamRadioInline1'
  TERMS_AND_CONDITIONS_ID = 'terms'
  RATE_EXPERIENCE_SLIDER_ID = 'value_for_slider'

  def visit_registration_page(url)
    visit(url)
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

  def select_sdet_stream
    find("label[for='#{STREAM_SDET_LABEL}']").click
  end

  def is_sdet_clicked
    find("input[id='#{STREAM_SDET_LABEL}']").selected?
  end

  def check_terms_and_conditions
    find("input[id='#{TERMS_AND_CONDITIONS_ID}']").click
  end

  def is_terms_and_conditions_clicked
    find("input[id='#{TERMS_AND_CONDITIONS_ID}']").selected?
  end

  def get_rating_experience
    find("span[id='#{RATE_EXPERIENCE_SLIDER_ID}']").text
  end
end
