class HomeController < ApplicationController
  def index
    @videos = Video.recent
  end
  
  def search
    query = params[:search][:query]
    @videos = Video.where("name LIKE ?", "%#{query}%")
  end
  
end
