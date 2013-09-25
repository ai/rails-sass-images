module RailsSassImages
  # Enable `lib/assets/`
  class Engine < ::Rails::Engine
  end

  # Rails integration
  class Railtie < Rails::Railtie
    initializer 'rails-sass-images' do
      RailsSassImages.assets = Rails.application.assets
    end
  end
end
