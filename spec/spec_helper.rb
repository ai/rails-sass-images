ENV['RAILS_ENV'] ||= 'test'

require_relative 'app/config/environment'
require_relative '../lib/rails-sass-images'

require 'rspec/rails'

DIR    = Pathname(__FILE__).dirname
INLINE = 'url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAQAAAAGCAAAAADB' +
         'UmCpAAAAC0lEQVQI12NgwAcAAB4AAW6FRzIAAAAASUVORK5CYII=")'
