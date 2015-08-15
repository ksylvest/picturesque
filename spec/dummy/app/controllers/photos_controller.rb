class PhotosController < ApplicationController

  # get /
  def index
    @photos = Photo.all
  end

end
