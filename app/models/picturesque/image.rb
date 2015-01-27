require 'mini_magick'

module Picturesque
  class Image
    include ActiveModel::Model

    DISPOSITION = 'inline'.freeze

    module Format
      JPG = 'jpg'.freeze
      PNG = 'png'.freeze
      GIF = 'gif'.freeze
    end

    module Quality
      HIGH = 90.freeze
    end

    attr_accessor :url
    attr_accessor :width
    attr_accessor :height
    attr_accessor :quality

    def initialize(url)
      self.url = url
    end

    def process(params = {})
      file = MiniMagick::Image.open(self.url)

      if params[:width] && Integer(params[:width]) > 0 && params[:height] && Integer(params[:height]) > 0
        file = file.resize("#{params[:width]}x#{params[:height]}#")
      end

      file = file.quality(params[:quality] || Quality::HIGH)
      file = file.format(params[:format] || Format::JPG)
      
      return file
    end

    def self.find(id)
      new('https://d1o2msdex49rzf.cloudfront.net/assets/banners/default-0eeaf9ea22f9733c89a453279f6d9672.jpg')
    end

  end
end
