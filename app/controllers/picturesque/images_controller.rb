require_dependency "picturesque/application_controller"

module Picturesque
  class ImagesController < ApplicationController

    # GET /:id/(:size)(/:quality)(/:slug).(:format)
    def show
      @image = Picturesque::Image.find(params)
      @file = @image.process(size: params[:size], quality: params[:quality], format: params[:format])

      canonical = picturesque.image_url(id: params[:id], slug: params[:slug])
      response.header['Link'] = "<#{canonical}>; rel=\"canonical\""

      expires_in 3.years, public: @file
      send_file @file.path, disposition: Picturesque::Image::DISPOSITION
    end

  end
end
