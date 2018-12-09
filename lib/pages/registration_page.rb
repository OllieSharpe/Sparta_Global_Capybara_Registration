require 'Capybara/dsl'

class Registration
  include Capybara::DSL

  attr_reader :first_name, :last_name, :age, :date_of_birth, :university, :degree, :university_locator

  def initialize
    @first_name = 'The Nefarious'
    @last_name = 'Mr. Dark'
    @age = "1000"
    @date_of_birth = '25121018'
    @university = 'University of Oxford'
    @degree = 'PhD Dark Lord Sorceries'
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

end
