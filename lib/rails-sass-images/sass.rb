require 'sassc'

dir = Pathname(__FILE__).dirname.join('sass')
Dir.glob(dir.join('*.rb').to_s) { |ext| require ext }

module SassC::Script::Functions
  include RailsSassImages::Sass
end

if defined? Sprockets
  module Sprockets
    class SasscProcessor
      module Functions
        include RailsSassImages::Sass
      end
    end
  end
end
