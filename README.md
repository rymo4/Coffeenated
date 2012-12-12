# Coffeenated, A Little Project by Ryder Moody

An open source rails app for reviewing fancy coffee. See it [live](http://coffeenated.herokuapp.com).

## What I'm Using

| What        | Why        |
|------------|------------|
| [Rails](https://github.com/rails/rails)     | It's quick to build with, and Ruby is awesome. |
| [MongoDB](http://www.mongodb.org/) w/ [Mongoid](http://mongoid.org/en/mongoid/) | It's quick to build with, good for lots of JSON blob data, and fun. |
| [Angular.js](http://angularjs.org/) | It makes client side rendering fun! This app does quite a bit of client side rendering. |
| [d3.js](http://d3js.org/)      | Awesome visualization library that is used for all the graphs. |
| [_.js](http://underscorejs.org/)       | Makes my JSON manipulations (and more!) pleasant so that I can do more on the client. |
| [Bootstrap](http://twitter.github.com/bootstrap/)  | Because I'm not a designer. |
| [ActiveModel::Serializer](https://github.com/rails-api/active_model_serializers) | Passing in options and overriding the rails json methods gets tedious and annoying. |
| [HAML](http://haml.info/) | Terse, clean, and infinitely better than ERB. |
| [CoffeeScript](http://coffeescript.org/) | ```reason = -> "Because of this."``` |

## What to Look At

First of all, make sure to click the first link and create an account on the site so that you can see everything.

| Link        | Why        |
|------------|------------|
| [home#index](http://coffeenated.herokuapp.com) | The homepage. Take a look, and click "Sign up" so that you can see the other pages. |
| [roasters#show](http://coffeenated.herokuapp.com/roasters/50baf95c76276f31dc000003) | The roasters#show is rendered completely client-side. You can see all the coffee from this roaster, some info, and the top coffees. Click one of the "details" buttons and you'll see the location where the coffee was grown, the d3 generated taste profile based on ratings, and a description. |
| [rankings#index](http://coffeenated.herokuapp.com/rankings) | More client-side rendering. A d3 graph for each of your tastings. |
| [rankings#new](http://coffeenated.herokuapp.com/rankings/new) | The way to actually review coffee. Some sliders to rate the coffee and a place to take some notes. The sliders create the data that is used for the d3 graphs. It's a little annoying to have to go to a new page to create a new coffee if you haven't tasted this one before, but a better system will have to wait. |


## If you want to Run it

* Make sure you have a mongo server running. 
* Make sure to use Ruby 1.9.3 (even 1.9.2 won't work)
* Have fun!

## License (MIT)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
