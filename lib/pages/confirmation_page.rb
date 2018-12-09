require 'Capybara/dsl'

class Confirmation

  include Capybara::DSL

  def current_url
    page.current_url
  end

end
