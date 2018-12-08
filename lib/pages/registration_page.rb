require 'Capybara/dsl'

class Registration

  include Capybara::DSL

  ADDRESS = 'inputAddress'
  ADDRESS2 = 'inputAddress2'
  CITY = 'inputCity'
  POSTCODE = 'inputPostcode'
  SKILLS = 'exampleFormControlTextarea1'
  COUNTY = 'inputCounty'

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

end
