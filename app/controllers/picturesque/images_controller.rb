require_dependency "picturesque/application_controller"

module Picturesque
  class ImagesController < ApplicationController

    # GET /:id/(:size)/(:quality)/(*slug).(:format)
    def show
      @image = Picturesque::Image.find(params[:id])
      @file = @image.process(size: params[:size], quality: params[:quality], format: params[:format])

      expires_in 3.years, public: @file
      send_file @file.path, disposition: Picturesque::Image::DISPOSITION
    end

  private

    def settings
      params.permit(:size,:quality,:format)
    end

  end
end
