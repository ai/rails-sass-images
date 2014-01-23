require 'dimensions'

module RailsSassImages::Sass
  # Get image width
  def image_width(path)
    asset = RailsSassImages.asset(path)
    Sass::Script::Number.new(Dimensions.width(asset), ["px"])
  end

  # Get image height
  def image_height(path)
    asset = RailsSassImages.asset(path)
    Sass::Script::Number.new(Dimensions.height(asset), ["px"])
  end
end
