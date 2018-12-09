require_relative 'spec_helper'

describe "Testing the registration form for Sparta Global" do

  before(:all) do
    @url = ENV['REGISTRATION_URL']
    @sparta_site = SpartaSite.new
    @sparta_site.registration_page.visit_registration_page(@url.to_s)
  end

  it "Should accept a given first name" do

  end

  it "Should accept a given last name" do

  end

  it "Should accept a given age" do

  end

  it "Should accept a given date of birth" do

  end

  it "Should accept one of either male or female" do

  end

  it "Should accept a degree title" do

  end

  it "Should accept select the correct university from the dropdown box" do

  end

end
