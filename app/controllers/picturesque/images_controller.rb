require_dependency "picturesque/application_controller"

module Picturesque
  class ImagesController < ApplicationController

    # GET /:id/(:size)/(:quality)/(*slug).(:format)
    def show
      @image = Picturesque::Image.find(params)
      @file = @image.process(size: params[:size], quality: params[:quality], format: params[:format])
      picturesque.image_path(id: params[:id], slug: params[:slug])

      expires_in 3.years, public: @file
      send_file @file.path, disposition: Picturesque::Image::DISPOSITION
    end

  end
end
