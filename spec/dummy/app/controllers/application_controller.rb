class ApplicationController < ActionController::Base
  helper Picturesque::Engine.helpers

  protect_from_forgery with: :exception
end
