require 'Capybara/dsl'

class Confirmation

  include Capybara::DSL

  attr_reader :registration_completed_url

  def initialize  
    @registration_completed_url = "https://crispyjourney.herokuapp.com/registration_complete?dob=1018-12-25&customRadioInline1=on&cv=istqb.pdf&streamRadioInline1=on"
  end

  def current_url
    page.current_url
  end

end
