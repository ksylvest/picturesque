# Picturesque

Picturesque is an engine for resizing and formatting images on the fly. It makes generating responsive images a snap:

```rb
<%= picturesque_image_tag(image, slug: image.slug, alt: image.name, size: '160x160') %>
```

```html
<img
  alt="Steve Jobs and Bill Gates"
  height=160
  width=160
  src="https://.../picturesque/.../160x160/steve-jobs-and-bill-gates.jpg"
  srcset="https://.../picturesque/.../160x160/steve-jobs-and-bill-gates.jpg 1x,
          https://.../picturesque/.../320x320/steve-jobs-and-bill-gates.jpg 2x,
          https://.../picturesque/.../480x480/steve-jobs-and-bill-gates.jpg 3x"
/>
```

## Requirements

The gem is tested with:

* Ruby on Rails 4.2.5.1
* Ruby 2.3.0
* JRuby 9.0.4.0

## Installation

```sh
gem install picturesque
```

## Additional

```
brew install imagemagick
```

## Configuration

```ruby
# config/initializers/picturesque.rb
Picturesque.setup do |config|
  config.find = -> (params) { Picturesque::Image.new(Image.find(params[:id]).url) }
end
```

## Examples

### Migration

```sh
rails g model image url:string name:string
```

```ruby
class CreateImage < ActiveRecord::Migration
  def self.up
    create_table :images do |t|
      t.string :url, presence: true, index: { unique: true }
      t.string :name, presence: true, index: { unique: true }

      t.timestamps
    end
  end

  def self.down
    drop_table :images
  end
end
```

### Model

```ruby
class Image < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :url, presence: true, uniqueness: true

  def slug
    name.parameterize if name
  end
end
```

### View

```rb
<%- @images.each do |image| -%>
<%= picturesque_image_tag(image, slug: image.slug, alt: image.name, size: '160x160') %>
<%- end -%>
```

## Copyright

Copyright (c) 2014 - 2020 Kevin Sylvestre. See LICENSE for details.
