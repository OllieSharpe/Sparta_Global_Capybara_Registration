require_relative 'pages/confirmation_page'
require_relative 'pages/registration_page'


class SpartaSite

  def confirmation_page
    Confirmation.new
  end

  def registration_page
    Registration.new
  end

end
