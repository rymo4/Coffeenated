# Coffeenated, A Weekend Project by Ryder Moody

An open source rails app for reviewing fancy coffee. See it [live](http://coffeenated.herokuapp.com).

## What I'm Using

| What        | Why        |
|------------|------------|
| Rails      | It's quick to build with, and Ruby is awesome. |
| MongoDB w/ Mongoid | It's quick to build with, good for lots of JSON blob data, and fun. |
| Angular.js | It makes client side rendering (almost) as easy as server side rendering. This app does quite a bit of client side rendering. |
| d3.js      | Awesome visualization library that is used for all the graphs. |
| _.js       | Makes my json manipulations (and more!) pleasant so that I can do more on the client. |
| Bootstrap  | Because I'm not a designer. |

## What to Look At

First of all. Make sure to click the first link and create an account on the site so that you can see everything.

| Link        | Why        |
|------------|------------|
| [home#index](http://coffeenated.herokuapp.com) | The homepage. Take a look, and click "Sign up" so that you can see the other pages. |
| [roasters#show](http://coffeenated.herokuapp.com/roasters/50baf95c76276f31dc000003) | The roasters#show is rendered completely client-side. You can see all the coffee from this roaster, some info, and the top coffees. *Click one of the "details" buttons* and you'll see the location where the coffee was grown, the d3 generated taste profile based on ratings, and a description. |
| [rankings#index](http://coffeenated.herokuapp.com/rankings) | More client-side rendering. A d3 graph for each of your tastings. |
| [rankings#new](http://coffeenated.herokuapp.com/rankings/new) | The way to actually review coffee. Some sliders to rate the coffee and a place to take some notes. The sliders create the data that is used for the d3 graphs. It's a little annoying to have to go to a new page to create a new coffee if you haven't tasted this one before, but a better system will have to wait. |

## What Isn't Here (and should be)

* Numbers next to the sliders when rating a coffee
* Lots of validations
* Some ```attr_accessible```s
* Nicer looking routes
* Lots of other little things - redirects, autofilling edit forms, etc.
