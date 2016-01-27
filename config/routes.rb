Picturesque::Engine.routes.draw do

  get ':id(/:size)(/:quality)(/:slug).:format', to: 'images#show', as: :image, constraints: {
    size: /\d+x\d+/,
    quality: /\d{2}/,
    format: /(bmp|bpg|gif|jpg|jpe|jpeg|png|webp)/
    }, defaults: { quality: Picturesque::Image::Quality::HIGH, format: Picturesque::Image::Format::JPG }

end
