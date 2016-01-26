Picturesque.setup do |config|
  config.find = -> (params) { Picturesque::Image.new(Image.find(params[:id]).url) }
end
