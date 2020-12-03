class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :insurance, :disclosure, :faq ]

  def home
  end

  def insurance
  end

  def disclosure
  end

  def faq
  end

end
