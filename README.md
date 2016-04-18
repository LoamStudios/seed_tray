# SeedTray

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'seed_tray'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install seed_tray

## Usage

SeedTray makes a couple assumptions about how you will organize your code.

You need to create a object to represent your app with the same name as your
Rails app. SeedTray will automatically use this object as the root of your view
classes.

You must add an object for for each controller#action combination for which you
want to provide custom javascript.

For example, let's say your Rails app is called `Fruit`. You need to have a
`fruit.js.coffee` in `assets/javascript`.

Let's say you have a controller named `BananasController` with actions `index`,
and `show`. You will need to add three objects in `bananas.js.coffee`:

* `Fruit.Bananas`

* `Fruit.Bananas.Index`

* `Fruit.Bananas.Show`

In each of these objects, you need to implement the `render` method:

In app/assets/javascript/bananas.js.coffee
``` coffeescript
class @Fruit.Bananas
    @render: ->
        # Custom coffeescript to run on every action

class @Fruit.Bananas.Index
    @render: ->
        # Custom coffeescript for bananas#index

class @Fruit.Bananas.Show
    @render: ->
        # Custom coffeescript for bananas#show
```

If you want some coffeescript to run site wide:

In fruit.js.coffee
``` coffeescript
class @Fruit
    constructor: ->
        Fruit.delegator.site_wide_render = ->
           # Do something
```

In application.js, require seed_tray *after* the rest of your JS is included.
``` javascript
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
...
//= require seed_tray
```

**HEADS UP:** Make sure your application object (`Fruit` from our
example) is added before the rest of your code or else, you will get an
undefined error.

To finish the install, instantiate the app object in applications.js if you
defined any methods or data on it:

``` javascript
var app = new Fruit();
```

Add the data attributes to the
``` html
<body <%= page_data_attr %> >
  ...
</body>
```

`page_data_attr` puts data attributes with the controller and action on your
page. For example, if you were visiting /bananas/1, you'd get:

``` html
<body data-controller='Bananas' data-action='Show' >
  ...
</body>
```
### Console Suppression

By default, SeedTray will write to your browser's console when a script is executed or skipped.  Depending on your Javascript driver in your test suite, these messages may show in your testing console as well.

To suppress these messages, simply add the following to the appropriate `config/environments/` file.
 
``` ruby
SeedTray.configure { |config| config.suppress_console = true }
```

## Namespaced Controllers

A controller named Admin::Dashboard becomes Admin_Dashboard in the convention.
More generally, module/word_word_controller becomes Module_WordWord. We replace
the scope operator with an underscore and CamelCase the controller name. See the
[helper definition](https://github.com/LoamStudios/seed_tray/blob/master/lib/seed_tray/data_attribute_helper.rb#L3)
for the exact details.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at
https://github.com/LoamStudios/seed_tray. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MITLicense](http://opensource.org/licenses/MIT).
