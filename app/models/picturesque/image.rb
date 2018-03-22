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
      HIGH = 90
    end

    attr_accessor :url

    def self.find(params)
      Picturesque.config.find.call(params)
    end

    def initialize(url)
      self.url = url
    end

    def process(size: nil, quality: nil, format: nil)
      MiniMagick::Image.open(url).format(format || Format::JPG) do |file|
        file.quality(quality || Quality::HIGH)
        resize(file: file, size: size) if size
      end
    end

  private

    def resize(file:, size:)
      width, height = size.split('x')
      return unless width && Integer(width).positive? && height && Integer(height).positive?
      file.resize("#{width}x#{height}^")
      file.gravity 'center'
      file.extent "#{width}x#{height}"
    end

  end
end
