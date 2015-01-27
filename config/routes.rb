Picturesque::Engine.routes.draw do

  get ':id(/:width/:height)(/:quality)(/*slug)(.:format)', to: 'images#show', as: :image, constraints: {
    width: /\d+/,
    height: /\d+/,
    quality: /\d{2}/,
    format: /(bmp|bpg|gif|jpg|jpe|jpeg|png|webp)/
    }, defaults: { quality: Picturesque::Image::Quality::HIGH, format: Picturesque::Image::Format::JPG }

end
