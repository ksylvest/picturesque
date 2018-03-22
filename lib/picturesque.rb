require 'mini_magick'

require 'picturesque/engine'
require 'picturesque/config'

module Picturesque

  def self.config
    @config ||= Picturesque::Config.new
  end

  def self.setup(&block)
    block.call(config)
  end

end
