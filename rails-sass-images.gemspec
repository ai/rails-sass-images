require './lib/rails-sass-images/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'rails-sass-images'
  s.version     = RailsSassImages::VERSION.dup
  s.date        = Time.now.strftime('%Y-%m-%d')
  s.summary     = 'Sass functions and mixins to inline images ' +
                  'and get images size'

  s.files            = `git ls-files`.split("\n")
  s.test_files       = `git ls-files -- {spec}/*`.split("\n")
  s.extra_rdoc_files = ['README.md', 'LICENSE', 'ChangeLog.md']
  s.require_path     = 'lib'

  s.author   = 'Andrey "A.I." Sitnik'
  s.email    = 'andrey@sitnik.ru'
  s.homepage = 'https://github.com/ai/rails-sass-images'
  s.license  = 'MIT'

  s.add_dependency 'sassc',      ['> 0']
  s.add_dependency 'dimensions', ['> 0']
  s.add_dependency 'mime-types', ['> 0']
end
