require_relative 'spec_helper'

describe "Testing the registration form for Sparta Global" do

  before(:all) do
    @url = ENV['REGISTRATION_URL']
    @sparta_site = SpartaSite.new
    @sparta_site.registration_page.visit_registration_page(@url.to_s)
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
    sleep 2
    expect(@sparta_site.registration_page.get_university).to eq @sparta_site.registration_page.university
  end

end
