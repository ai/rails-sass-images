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

require 'dimensions'

module RailsSassImages::Sass
  # Get image width
  def image_width(path)
    asset = RailsSassImages.asset(path)
    Sass::Script::Number.new(Dimensions.width(asset.pathname), ["px"])
  end

  # Get image height
  def image_height(path)
    asset = RailsSassImages.asset(path)
    Sass::Script::Number.new(Dimensions.height(asset.pathname), ["px"])
  end
end
