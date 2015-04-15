# CoffeeControllers::Rails

With CoffeeControllers, you can define your [CoffeeScript](http://coffeescript.org/) scripts that are going to be ran specifically to the action being executed at the current request.
So your scripts are better organized following convention over configuration.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'coffee_controllers-rails'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install coffee_controllers-rails

It depends of [coffee-rails](https://github.com/rails/coffee-rails) that is also going to be installed.

## Setup

In your `application.js` file, add:

```javascript
//= require coffee_controllers/all
```

In your views layout file, say `application.html.erb`, add this to the `body` tag:

```html
<body data-controller="<%= controller.controller_path %>"
      data-action="<%= controller.action_name %>">
```

This is required to keep track of which `controller#action` corresponds to the current request.

## Usage

Suppose you have a rails controller `HomeController` with the action `index`:

```ruby
class HomeController < ApplicationController
  def index
    # code...
  end
end
```


You can add a `home.js.coffee` file with:

```coffeescript
# app/assets/javascripts/home.js.coffee

@HomeController = class HomeController
  index: ->
    alert 'Hello, world!'
```

So, for every request to the `index` action, as soon as the DOM is ready, the `index` function will be ran, displaying the `alert`.

### Remind

The controller's class name MUST be the same name of the rails controller counterpart. For example:

```coffeescript
# class FooController < ApplicationController
@FooController = class FooController

# class FooBarController < ApplicationController
@FooBarController = class FooBarController

# class Foo::BarHomeController < ApplicationController
@FooBarHomeController = class FooBarHomeController
```

### Init

You can define a `init` function to your coffee controllers that is going to be executed before every action function. For example:

```coffeescript
@HomeController = class HomeController
  init: ->
    alert 'initializing...'

  index: ->
    alert 'index action'

  show: ->
    alert 'show action'
```

## Reference

[jerodsanto.net](http://jerodsanto.net/2012/02/a-simple-pattern-to-namespace-and-selectively-execute-certain-bits-of-javascript-depending-on-which-rails-controller-and-action-are-active/)

## Todo

- Lacking some JS tests

## Contributing

Questions or problems? Please post them on the [issue tracker](https://github.com/imaboldcompany/coffee_controllers-rails/issues).

You can contribute by doing the following:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

To test the application run `bundle install` and then `rake test`. It needs [PhantomJS](http://phantomjs.org/) to be installed.

## License

MIT License.
