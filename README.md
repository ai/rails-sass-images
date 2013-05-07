# Rails Sass Images

Sass functions and mixins to inline images and get images size:

```sass
.icon
  +image-size("icon.png")
  background: inline("icon.png")

.icon-wrap
  width: image-width("icon.png") + 6px
  height: image-height("icon.png")
```

with HiDPI (Retina) support:

```sass
.icon
  +hidpi-inline("icon.png")

.background
  +hidpi-image("big-image.jpg")
```

and fonts support:

```sass
@font-face
  font-family: "MyFont"
  src: inline("my.woff") format('woff')
```

Sponsored by [Evil Martians](http://evilmartians.com/).

## Features

Instead of Compass, Rails Sass Images has:

* HiDPI (Retina) support.
* Full Assets Pipeline support.
* Useful shortcuts.
* More file types support.
* Smaller and cleaner code.

If you still need Compass for CSS 3 prefixes,
see [Autoprefixer](https://github.com/ai/autoprefixer).

## Usage

### Ruby on Rails

Add gem to your Rails `Gemfile`:

```ruby
gem "rails-sass-images"
```

and import mixins in your `application.sass`:

```sass
@import "rails-sass-images"
```

# Other

You can use Rails Sass Images with plain Ruby application with Sprockets.
Just install in to Sprockets environment:

```ruby
require 'rails-sass-images'

RailsSassImages.install(sprockets_env)
```

and import mixins in your Sass files:

```sass
@import "rails-sass-images"
```
