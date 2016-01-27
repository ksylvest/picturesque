module Picturesque
  module ApplicationHelper

    def picturesque_image_tag(image, size:, slug:, alt:, scales: (1..3))
      matches = size.match(/(?<w>\d+)\D(?<h>\d+)/)
      w , h = Integer(matches[:w]) , Integer(matches[:h])

      image_tag picturesque.image_url(image, size: "#{w}x#{h}", slug: image.slug),
        srcset: scales.map { |s| "#{picturesque.image_url(image, size: "#{w * s}x#{h * s}", slug: slug)} #{s}x" }.join(','),
        size: "#{w}×#{h}", alt: alt
    end

  end
end
