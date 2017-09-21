# Cryptozoologist [![Build Status](https://travis-ci.org/feministy/cryptozoologist.svg?branch=master)](https://travis-ci.org/feministy/cryptozoologist)

Cryptozoologist generates random strings from animal, clothing item, and color pairings, as well as lorem ipsum style sentences. 

You could get something like "orange-clownfish-turtleneck" or "magenta-three-toed-sloth-shoe-horn". It's fun and silly, because why not? The gem can be configured to use a custom delimiter, exclude dictionaries, or add in speciality dictionaries.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cryptozoologist'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cryptozoologist

## Documentation

In addition to the brief overview provided here, you can read more about each method, configuration, and general usage in the [Docs](/docs) section of this repo.

## Usage

Cryptozoologist provides four main functions:

* [`Cryptozoologist.random`](docs/random.md): returns a string separated by a delimiter
* [`Cryptozoologist.lorem(sentence_count)`](docs/lorem.md): returns `sentence_count` number of sentences
* [`Cryptozoologist.street_address`](docs/street_address.md): returns a string formatted to US street address standards
* [`Cryptozoologist.city`](docs/city.md): returns a string representing a city 

## Custom configuration

More on this in the [docs](docs/config.md)!
