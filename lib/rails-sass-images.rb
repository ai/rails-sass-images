require 'pathname'

module RailsSassImages
  # Return asset by file `path` from Sass parser
  def self.asset(path)
    path  = path.value

    @load_from = @load_from.call() if @load_from.is_a? Proc

    if @load_from.is_a? Pathname
      asset = @load_from.join(path)
      raise "Can't find asset #{path} in #{@load_from}" unless asset.exist?
    elsif sprockets? @load_from
      asset = @load_from[path]
      raise "Can't find asset #{path}" unless asset
      asset = Pathname.new(asset.filename)
    else
      raise "Unknown type of RailsSassImages.load_from"
    end

    asset
  end

  # Set Sprockets environment and add Rails Sass Images styles paths
  def self.install(sprockets)
    sprockets.append_path(Pathname(__FILE__).dirname.join('assets/stylesheets'))
    @load_from = sprockets
  end

  # Set Sprockets environment or assets dir path
  def self.load_from=(source)
    source = Pathname(source) if source.is_a? String
    @load_from = source
  end

  # Get Sprockets environment or assets dir path
  def self.load_from
    @load_from
  end

private

  # Safe detect is `var` is a Sprockets environment
  def self.sprockets?(var)
    return false unless defined? Sprockets
    var.is_a? Sprockets::Environment or var.is_a? Sprockets::CachedEnvironment
  end
end

RailsSassImages.load_from = '.'

dir = Pathname(__FILE__).dirname.join('rails-sass-images')
require dir.join('version')
require dir.join('sass')
require dir.join('railtie') if defined?(Rails)
