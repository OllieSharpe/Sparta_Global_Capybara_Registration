require 'Capybara/dsl'

class Confirmation

  include Capybara::DSL

  attr_reader :registration_completed_url, :confirmation_message

  def initialize
    
    @registration_completed_url = "https://crispyjourney.herokuapp.com/registration_complete"
    @confirmation_message = "You have successfully registered an account with Sparta Global!"
  end

  def current_url
    page.current_url
  end

  def get_confirmation_message
    # find("class[name='container']").text
    find(:xpath, '/html/body/div/h3').text
  end
end
