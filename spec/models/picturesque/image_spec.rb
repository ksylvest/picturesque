require 'rails_helper'

RSpec.describe Picturesque::Image, type: :model do
  let (:url) { "https://picturesque/sample" }
  let (:file) { double() }

  describe "#process" do
    it "processes an image with no parameters" do
      expect(MiniMagick::Image).to receive(:open).with(url) do |&block|
        block.call(file)
      end

      expect(file).to receive(:quality).with(Picturesque::Image::Quality::HIGH)
      expect(file).to receive(:format).with(Picturesque::Image::Format::JPG)

      Picturesque::Image.new(url).process()
    end

    it "processes an image with a size" do
      expect(MiniMagick::Image).to receive(:open).with(url) do |&block|
        block.call(file)
      end

      expect(file).to receive(:resize).with("960x960#")
      expect(file).to receive(:quality).with(Picturesque::Image::Quality::FULL)
      expect(file).to receive(:format).with(Picturesque::Image::Format::PNG)

      Picturesque::Image.new(url).process(size: "960x960",
        quality: Picturesque::Image::Quality::FULL,
        format: Picturesque::Image::Format::PNG,
      )
    end
  end
end
