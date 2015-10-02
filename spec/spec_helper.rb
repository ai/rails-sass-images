ENV['RAILS_ENV'] ||= 'test'

require_relative 'app/config/environment'
require_relative '../lib/rails-sass-images'

require 'rspec/rails'

DIR        = Pathname(__FILE__).dirname
INLINE     = 'url("data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAQAAAAGCAAAAADB' +
             'UmCpAAAAC0lEQVQI12NgwAcAAB4AAW6FRzIAAAAASUVORK5CYII=")'
INLINE_SVG = 'url("data:image/svg+xml;charset=utf-8,%3Csvg%20xmlns%3D%22http%3A%2F%2F' +
             'www.w3.org%2F2000%2Fsvg%22%20viewBox%3D%220%200%201%201%22%3E%3Cpath' +
             '%20d%3D%22M0%2C0h1v1H0%22%20fill%3D%22%23ff0000%22%2F%3E%3C%2Fsvg%3E%0A")'
