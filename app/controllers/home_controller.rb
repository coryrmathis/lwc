class HomeController < ApplicationController
  def landing
    redirect_to :songs
  end
end
