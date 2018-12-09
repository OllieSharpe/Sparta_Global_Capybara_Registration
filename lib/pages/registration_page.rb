require 'Capybara/dsl'

class Registration
  include Capybara::DSL


  def visit_registration_page(url)
    visit(url)
  end

end
