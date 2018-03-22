module Picturesque
  module ApplicationHelper

    def picturesque_image_tag(image, size:, slug:, alt:, scales: (1..3))
      matches = size.match(/(?<width>\d+)\D(?<height>\d+)/)
      width = Integer(matches[:width])
      height = Integer(matches[:height])

      image_tag(
        picturesque_src(image, width: width, height: height, slug: slug),
        srcset: picturesque_srcset(image, scales: scales, width: width, height: height, slug: slug),
        size: "#{width}×#{height}", alt: alt
      )
    end

    def picturesque_srcset(image, scales:, width:, height:, slug:)
      picturesque_srcs(image, scales: scales, width: width, height: height, slug: slug).join(',')
    end

    def picturesque_srcs(image, scales:, width:, height:, slug:)
      scales.map do |scale|
        "#{picturesque_src(image, width: width * scale, height: height * scale, slug: slug)} #{scale}x"
      end
    end

    def picturesque_src(image, width:, height:, slug:)
      picturesque.image_url(image, size: "#{width}×#{height}", slug: slug)
    end
  end
end
