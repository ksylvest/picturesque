module Picturesque
  class Image
    include ActiveModel::Model

    DISPOSITION = "inline".freeze

    module Format
      JPG = "jpg".freeze
      PNG = "png".freeze
      GIF = "gif".freeze
    end

    module Quality
      HIGH = 90.freeze
    end

    attr_accessor :url

    def initialize(url)
      self.url = url
    end

    def process(size: nil, quality: nil, format: nil)
      MiniMagick::Image.open(self.url).format(format || Format::JPG) do |file|
        file.quality(quality || Quality::HIGH)

        if size
          w,h = size.split("x")
          if w && Integer(w) > 0 && h && Integer(h) > 0
            file.resize("#{w}x#{h}^")
            file.gravity "center"
            file.extent "#{w}x#{h}"
          end
        end
      end
    end

    def self.find(params)
      Picturesque.config.find.call(params)
    end

  end
end
