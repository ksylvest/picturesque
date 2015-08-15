Picturesque.setup do |config|
  config.url = -> (id) { Photo.find(id).url }
end
