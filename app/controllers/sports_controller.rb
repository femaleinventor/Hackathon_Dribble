class SportsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def index
    @sports = Sport.all 
  end
end
