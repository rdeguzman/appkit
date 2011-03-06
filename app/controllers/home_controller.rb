class HomeController < ApplicationController
  def index
    @app_profiles = AppProfile.all
  end

  def overview
  end

  def pricing
  end

  def faq
  end

  def about_us
  end

  def contact_us 
  end

end
