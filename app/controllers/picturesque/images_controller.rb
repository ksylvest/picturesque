require_dependency "picturesque/application_controller"

module Picturesque
  class ImagesController < ApplicationController

    # GET /images/:width/:height/
    def show
      @image = Picturesque::Image.find(params[:id])
      @file = @image.process(settings)

      send_file @file.path, disposition: Picturesque::Image::DISPOSITION
    end

  private

    def settings
      params.permit(:width,:height,:quality,:format)
    end

  end
end
