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

end
