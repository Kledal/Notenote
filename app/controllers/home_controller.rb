class HomeController < ApplicationController
  def index
    render :index, flush: true
  end
end
