require 'rails_helper'

RSpec.describe Picturesque::Image, type: :model do
  let (:url) { "https://picturesque/sample" }
  let (:file) { double() }

  describe "#process" do
    it "processes an image with no parameters" do
      expect(MiniMagick::Image).to receive(:open).with(url) { file }

      expect(file).to receive(:format).with(Picturesque::Image::Format::JPG) do |&block|
        block.call(file)
      end

      expect(file).to receive(:quality).with(Picturesque::Image::Quality::HIGH)

      Picturesque::Image.new(url).process()
    end

    it "processes an image with a size" do
      expect(MiniMagick::Image).to receive(:open).with(url) { file }

      expect(file).to receive(:format).with(Picturesque::Image::Format::PNG) do |&block|
        block.call(file)
      end

      expect(file).to receive(:resize).with("64x64^")
      expect(file).to receive(:gravity).with("center")
      expect(file).to receive(:extent).with("64x64")

      expect(file).to receive(:quality).with(Picturesque::Image::Quality::HIGH)

      Picturesque::Image.new(url).process(size: "64x64",
        quality: Picturesque::Image::Quality::HIGH,
        format: Picturesque::Image::Format::PNG,
      )
    end
  end
end
