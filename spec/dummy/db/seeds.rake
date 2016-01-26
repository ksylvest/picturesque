Image.find_or_create_by!(name: "Weather") do |image|
  image.url = "https://farm1.staticflickr.com/444/18745249622_88654d0ae1_o.jpg"
end

Image.find_or_create_by!(name: "Gondola") do |image|
  image.url = "https://farm9.staticflickr.com/8855/18750563775_aa7dbf96fd_o.jpg"
end

Image.find_or_create_by!(name: "Isolate") do |image|
  image.url = "https://farm8.staticflickr.com/7752/18174266840_558f5d65a1_o.jpg"
end
