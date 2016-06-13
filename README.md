# Cryptozoologist [![Build Status](https://travis-ci.org/feministy/cryptozoologist.svg?branch=master)](https://travis-ci.org/feministy/cryptozoologist)

_Cryptozoologist is a fun little gem written as part of the [Gem guide](https://github.com/feministy/gem-guide) project._

Cryptozoologist generates random strings from animal, clothing item, and color pairings. You could get something like "orange-clownfish-turtleneck" or "magenta-three-toed-sloth-shoe-horn". It's fun and silly, because why not?

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

`Cryptozoologist.generate` method will return a string separated by `-` containing: a color, an animal, and an item of clothing.

Example:

```ruby
Cryptozoologist.generate # => 'steel-blue-tang-flak-jacket'
Cryptozoologist.generate # => 'blanched-almond-mandrill-headscarf'
Cryptozoologist.generate # => 'frozen-in-time-cockroach-bracelet'
Cryptozoologist.generate # => 'medium-sea-green-lobster-coat'
Cryptozoologist.generate # => 'blue-flying-squirrel-trench-coat'
Cryptozoologist.generate # => 'thistle-toucan-formal-wear'
Cryptozoologist.generate # => 'aquamarine-lemming-white-tie'
Cryptozoologist.generate # => 'tomato-cerberus-sweatshirt'
Cryptozoologist.generate # => 'forest-green-wasp-getup'
```

### Generate a random color, animal, clothing item, or measure of quantity

These dictionaries will also follow your configuration settings (see below).

```ruby
Cryptozoologist::Dictionary.animals.sample
Cryptozoologist::Dictionary.clothing.sample
Cryptozoologist::Dictionary.colors.sample
Cryptozoologist::Dictionary.quantity.sample
```

## Configuration 

Configuration blocks take the following options:

```ruby
  Cryptozoologist.configure do |config|
    config.exclude = []
    config.include = []
    config.order = []
    config.delimeter = ''
  end
```

- `exclude` (array of symbols) allows you to exclude dictionary subtypes; defaults to no exclusions
- `include` (array of symbols) allows you to include optional dictionaries; defaults to no inclusions
- `order` (array of symbols) allows you to change the word order; defaults to animal-color-clothing
- `delimeter` (string) allows you to specify a delimeter; defaults to `-`

### Configuration options

**Include (`config.include`, `[]`):**

- if you include quantity, it will be added to the front of your generated string
- `:quantity`

**Exclude (`config.exclude`, `[]`):**

- animals (1 of 2 allowed):
  - `:common`, `:mythical`
- colors (1 of 2 allowed):
  - `:paint`, `:web`

**Order (`config.order`, `[]`): **

- **must provide all 3 keys** as an array in the order in which you want words to appear
- `[:animals, :colors, :clothing]`

**Delimeter (`config.delimeter`, `''`):**

- defaults to `'-'`
- any string is valid

#### Example

```ruby
  Cryptozoologist.configure do |config|
    config.exclude = [:common]
    config.include = [:quantity]
    config.order = [:colors, :animals, :clothing]
    config.delimeter = '_'
  end

  Cryptozoologist.generate # => 'masses_yellow_zombie_shrug'
  Cryptozoologist.generate # => 'gazillions_polar_drift_goblin_umbrella'
  Cryptozoologist.generate # => 'wide_orange_cynocephalus_helmet'
  Cryptozoologist.generate # => 'some_light_pink_moke_fedora'
```
