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

require 'pathname'
dir = Pathname(__FILE__).dirname.join('rails-sass-images')

module RailsSassImages
  # Enable `lib/assets/`
  class Engine < ::Rails::Engine
  end

  # Return asset by file `path` from Sass parser
  def self.asset(path)
    path  = path.value
    asset = Rails.application.assets[path]
    raise "Can't find asset #{path}" unless asset
    asset
  end
end

require dir.join('version')
require dir.join('sass')
