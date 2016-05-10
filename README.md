# Cryptozoologist [![Build Status](https://travis-ci.org/feministy/cryptozoologist.svg?branch=master)](https://travis-ci.org/feministy/cryptozoologist)

_Cryptozoologist is a fun little gem written as part of the [Gem guide](https://github.com/feministy/gem-guide) project._

Cryptozoologist generates random strings from animal, clothing item, and color pairings. You could get something like "orange-clownfish-turtleneck" or "magenta-three-toed-sloth-shoe-horn". It's fun and silly - it's also very simple, which is why it is used as an example for the Gem guide project.

This gem is still in active devemopment; complete documentation _will be added_ as the gem (and the Gem guide) progress!

_(No, really, it will be added: it's part of the guide!)_

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cryptozoologist'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cryptozoologist

## Usage

Right now, this gem doesn't do much of anything except over architect a series of word lists.

**Available word lists**

- colors
- animals

**Configuration options**

Exclude:

- animals:
  - `:common`, `:mythical`
- colors:
    - `:paint`, `:web`

*Note:* you can only exclude one of each or you won't have any words in your list!

**Example**

    Cryptozoologist.configurre do |config|
      config.exclude = [:common]
    end
    dictionary = Cryptozoologist::Dictionary.new
    animals = dictionary.animals
    animals.sample # => "crumple horned snorkack"

**Get a random animal**

    dictionary = Cryptozoologist::Dictionary.new
    animals = dictionary.animals
    animals.sample # => "sun bear"

**Get a random color**

    dictionary = Cryptozoologist::Dictionary.new
    colors = dictionary.colors
    colors.sample # => "pink"
