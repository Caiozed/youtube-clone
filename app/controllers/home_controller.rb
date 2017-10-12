class HomeController < ApplicationController
  def index
    @videos = Video.order(updated_at: :desc)
  end
end
