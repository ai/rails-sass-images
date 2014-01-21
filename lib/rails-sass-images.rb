require 'pathname'

module RailsSassImages
  # Return asset by file `path` from Sass parser
  def self.asset(path)
    path  = path.value
    asset = self.assets[path]
    raise "Can't find asset #{path}" unless asset
    asset
  end

  # Set Sprockets environment and add Rails Sass Images styles paths
  def self.install(sprockets)
    sprockets.append_path(Pathname(__FILE__).dirname.join('assets/stylesheets'))
    self.assets = sprockets
  end

  # Set Sprockets environment
  def self.assets=(env = nil)
    @assets = env
  end

  # Get Sprockets environment
  def self.assets
    if @assets
      @assets
    elsif @assets_loader
      @assets = @assets_loader.call()
    end
  end

  # Set lazy loader for assets
  def self.assets_loader=(loader)
    @assets_loader = loader
  end
end

dir = Pathname(__FILE__).dirname.join('rails-sass-images')
require dir.join('version')
require dir.join('sass')
require dir.join('railtie') if defined?(Rails)
