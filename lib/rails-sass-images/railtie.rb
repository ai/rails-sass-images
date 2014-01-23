module RailsSassImages
  # Enable `lib/assets/`
  class Engine < ::Rails::Engine
  end

  # Rails integration
  class Railtie < Rails::Railtie
    RailsSassImages.load_from = proc { Rails.application.assets }
  end
end
