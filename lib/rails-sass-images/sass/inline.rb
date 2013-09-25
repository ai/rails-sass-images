require 'mime-types'

module RailsSassImages::Sass
  # Inline asset file to CSS by data-uri. Can be used for images and fonts.
  #
  #   .icon
  #     background: inline("icon.png")
  #
  #   @font-face
  #     font-family: "MyFont"
  #     src: inline("my.woff") format('woff')
  def inline(path)
    asset = RailsSassImages.asset(path)

    mime = MIME::Types.type_for(asset.pathname.to_s).first.content_type
    file = asset.pathname.read
    file = [file].flatten.pack('m').gsub("\n", '')

    Sass::Script::String.new("url('data:#{mime};base64,#{file}')")
  end
end
