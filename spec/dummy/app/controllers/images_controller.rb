class ImagesController < ApplicationController

  # GET /
  def index
    @images = Image.all
  end

end
