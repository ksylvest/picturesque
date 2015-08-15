Rails.application.config.action_dispatch.cookies_serializer = :json
Rails.application.config.session_store :cookie_store, key: '_picturesque_session'

ActiveSupport.on_load(:action_controller) do
  wrap_parameters format: [:json] if respond_to?(:wrap_parameters)
end

Rails.application.config.filter_parameters += [:password]
