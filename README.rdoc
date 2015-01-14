# CoffeeControllers::Rails

By [Ima Bold](http://imabold.com).

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

The gem also depends of `jQuery` to work properly. Either use [jquery-rails](https://github.com/rails/jquery-rails) or add it by yourself.

## Setup

In your views layout file, say `application.html.erb`, add this to the `body` tag:

```html
<body data-controller="<%= controller.controller_path %>"
      data-action="<%= controller.action_name %>">
```

This is need to keep track of which `controller#action` corresponds to the current request.

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

class HomeController
  index: ->
    alert 'Hello, world!'

setController 'home', new HomeController()
```

So, for every request to the `index` action, as soon as the DOM is ready, the `index` function will be ran, displaying the `alert`.

### Remind

For every coffee controller defined, you need to attach it through the `setController` function.

```coffeescript
# setController controllerName, controllerObject

setController 'foo', new FooController()
```

The `controllerName` has to be the name of the controller underscored. For example:

```coffeescript
# class FooController < ApplicationController
setController 'foo', new FooController()

# class FooBarController < ApplicationController
setController 'foo_bar', new FooBarController()

# class Foo::BarHomeController < ApplicationController
setController 'foo_bar_home', new FooBarHomeController()
```

### Init

You can define a `init` function to your coffee controllers that is going to be executed before every action function. For example:

```coffeescript
class HomeController
  init: ->
    alert 'initializing...'

  index: ->
    alert 'index action'

  show: ->
    alert 'show action'
```

## Reference

[jerodsanto.net](http://jerodsanto.net/2012/02/a-simple-pattern-to-namespace-and-selectively-execute-certain-bits-of-javascript-depending-on-which-rails-controller-and-action-are-active/)

## Contributing

Questions or problems? Please post them on the [issue tracker](https://github.com/imaboldcompany/coffee_controllers-rails/issues).

You can contribute by doing the following:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

MIT License.
