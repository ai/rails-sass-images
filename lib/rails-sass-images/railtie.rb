module RailsSassImages
  # Enable `lib/assets/`
  class Engine < ::Rails::Engine
  end

  # Rails integration
  class Railtie < Rails::Railtie
    RailsSassImages.load_from = proc do
      Rails.application.assets ||
        Sprockets::Railtie.build_environment(Rails.application)
    end
  end
end
