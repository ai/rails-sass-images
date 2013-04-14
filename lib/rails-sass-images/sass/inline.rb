=begin
Copyright 2013 Andrey “A.I.” Sitnik <andrey@sitnik.ru>,
sponsored by Evil Martians.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Lesser General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
=end

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
    path  = path.value
    asset = Rails.application.assets[path]
    raise "Can't find asset #{path}" unless asset

    mime = MIME::Types.type_for(asset.pathname.to_s).first.content_type
    file = asset.pathname.read
    file = [file].flatten.pack('m').gsub("\n", '')

    Sass::Script::String.new("url('data:#{mime};base64,#{file}')")
  end
end
