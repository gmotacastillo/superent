class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def home
    @array = ["Super","Hyper","Luxury"]
  end
end
