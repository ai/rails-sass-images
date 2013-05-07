App::Application.configure do
  config.eager_load                                 = false
  config.cache_classes                              = true
  config.serve_static_assets                        = true
  config.static_cache_control                       = "public, max-age=3600"
  config.active_support.deprecation                 = :stderr
  config.consider_all_requests_local                = true
  config.action_dispatch.show_exceptions            = false
  config.action_controller.perform_caching          = false
  config.action_controller.allow_forgery_protection = false

  config.assets.css_compressor = :sass
end
