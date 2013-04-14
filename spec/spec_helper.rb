# encoding: utf-8
ENV['RAILS_ENV'] ||= 'test'

DIR = Pathname(__FILE__).dirname
require DIR.join('app/config/environment').to_s
require DIR.join('../lib/rails-sass-images').to_s

require 'pp'
require 'rspec/rails'
