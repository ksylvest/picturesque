Picturesque.setup do |config|
  config.url = lambda { |id| Photo.find(id).url }
end
