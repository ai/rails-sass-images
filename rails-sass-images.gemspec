require './lib/rails-sass-images/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'rails-sass-images'
  s.version     = RailsSassImages::VERSION.dup
  s.date        = Time.now.strftime('%Y-%m-%d')
  s.summary     = 'Add to Sass function to inline images and get images size'

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {spec}/*`.split("\n")
  s.extra_rdoc_files = ['README.md', 'LICENSE', 'ChangeLog']
  s.require_path     = 'lib'

  s.author   = 'Andrey "A.I." Sitnik'
  s.email    = 'andrey@sitnik.ru'
  s.homepage = 'https://github.com/ai/rails-sass-images'

  s.add_dependency 'sass-rails', ['> 0']
  s.add_dependency 'rails',      ['>= 3.1']
end
