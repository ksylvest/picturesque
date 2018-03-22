require_dependency 'picturesque/application_controller'

module Picturesque
  class ImagesController < ApplicationController

    # GET /:id/(:size)(/:quality)(/:slug).(:format)
    def show
      @image = Picturesque::Image.find(params)
      @file = @image.process(params.slice(:size, :quality, :format))

      setup_canonical_link

      expires_in 3.years, public: @file
      send_file @file.path, disposition: Picturesque::Image::DISPOSITION
    end

  private

    def setup_canonical_link
      canonical = picturesque.image_url(params.slice(:id, :slug))
      response.header['Link'] = %(<#{canonical}>; rel="canonical")
    end

  end
end
