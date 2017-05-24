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

## Usage

Cryptozoologist provides four main functions:

* `Cryptozoologist.random`: returns a string separated by a delimiter (_Note_: aliased as `Cryptozoologist.generate` for backwards compatibility with anything below version 3)
* `Cryptozoologist.lorem(sentence_count)`: returns `sentence_count` number of sentences, separated by punctuation randomly selected from `["!", ".", "?"]`
* `Cryptozoologist.street_address`: returns a string formatted to US street address standards (house number and street name) using the animal dictionaries (_Note_: ignores animal subdictionary exclusions)
* `Cryptozoologist.state`: returns a string of a state name combined with a random word from other internal dictionaries (_Note_: ignores dictionary exclusions) 

Each method will respect your configuration settings where applicable.

See below for more detailed usage on each method.

### Secret usage

If you just want a word list, you can tap directly into the dictionaries. Each dictionary returns an array of strings, allowing you to use the Ruby enumerators that you want on your word list.

The complete list of dictionaries includes:

* `Cryptozoologist::Dictionary.animals`
* `Cryptozoologist::Dictionary.clothing`
* `Cryptozoologist::Dictionary.colors`
* `Cryptozoologist::Dictionary.quantity`
* `Cryptozoologist::Dictionary.filler` ("a", "the", etc)
* `Cryptozoologist::Dictionary.punctuation`
* `Cryptozoologist::Dictionary.addresses` ("Lane", "Street", etc - I don't know what this part of an address is called!)
* `Cryptozoologist::Dictionary.states`

### `Cryptozoologist.random`

The `Cryptozoologist.random` method will return a string separated by `-` (or your custom delimiter) containing: a color, an animal, and an item of clothing.

Example:

```ruby
Cryptozoologist.random # => 'steel-blue-tang-flak-jacket'
Cryptozoologist.random # => 'blanched-almond-mandrill-headscarf'
Cryptozoologist.random # => 'frozen-in-time-cockroach-bracelet'
Cryptozoologist.random # => 'medium-sea-green-lobster-coat'
Cryptozoologist.random # => 'blue-flying-squirrel-trench-coat'
Cryptozoologist.random # => 'thistle-toucan-formal-wear'
Cryptozoologist.random # => 'aquamarine-lemming-white-tie'
Cryptozoologist.random # => 'tomato-cerberus-sweatshirt'
Cryptozoologist.random # => 'forest-green-wasp-getup'
```

If your config includes the `Quantity` dictionary, it will be prepended to your string.

### `Cryptozoologist.lorem(sentence_count)`

`Cryptozoologist.lorem(sentence_count)` will return a string consisting of the number of sentences you request. It will use every dictionary available based on your config.

Example:

```ruby
Cryptozoologist.lorem(3) # => 'Black rhinoceros and it hundreds at flamingo dream oodles acres gear it plum serval shrug phoenix blazer washed khaki! Phantom mist the gazillions hem alicorn light golden rod yellow leopard cat troop and galoshes a be. Are there stellers sea cow billions be plum indri dodger blue shift to t shirt cheetah tiara tons sky blue miles?'

Cryptozoologist.lorem(1) # => 'And headscarf to potentially purple pygmy puff chocolate wide tights yak bundles the be?'
```

### `Cryptozoologist.street_address`

Haven't you always wanted a cool address like 12 Pygmy Puff Court? Me, too.

```ruby
Cryptozoologist.street_address # => 2295 Red Panda Avenue
Cryptozoologist.street_address # => 947 Valkyrie Way
Cryptozoologist.street_address # => 2415 Goblin Street
Cryptozoologist.street_address # => 2558 Sea Dragon Court
```

This only uses the `Animal` dictionaries and will *ignore your configuration to exclude subdictionaries*.

### `Cryptozoologist.state`

One of the 50 United States is randomly selected, and a fun new name is created from it! If the state name is two words, one of the words
will be completely replaced. If the state name is one word, then a word from another library will be interspersed into the original state name.
All replacement strings from the non-state dictionaries are alliterative, so the new, fun state name flows right off of the tongue.

```ruby
Cryptozoologist.state # => "Newt Hampshire"
Cryptozoologist.state # => "Missingletissippi"
Cryptozoologist.state # => "Californiguana"
```

This uses `Animal`, `Color`, and `Clothing` libraries and ignores exclusions.

## Configuration

Configuration blocks take the following options:

```ruby
  Cryptozoologist.configure do |config|
    config.exclude = []
    config.include = []
    config.order = []
    config.delimiter = ''
  end
```

- `exclude` (array of symbols) allows you to exclude dictionary subtypes; defaults to no exclusions
- `include` (array of symbols) allows you to include optional dictionaries; defaults to no inclusions
- `order` (array of symbols) allows you to change the word order; defaults to `animal-color-clothing`
- `delimiter` (string) allows you to specify a delimiter; defaults to `-`

### Configuration options

**Include (`config.include`, `[]`):**

- if you include quantity, it will be added to the front of your generated string
- options: `:quantity`

**Exclude (`config.exclude`, `[]`):**

4 options are available for this, but you can only use 2 at a time (one from each category):

- animals (1 of 2 allowed):
  - `:common`, `:mythical`
- colors (1 of 2 allowed):
  - `:paint`, `:web`

**Order (`config.order`, `[]`):**

- **must provide all 3 keys** as an array in the order in which you want words to appear
- `[:animals, :colors, :clothing]`

**delimiter (`config.delimiter`, `''`):**

- defaults to `'-'`
- any string is valid

#### Example with all possible settings

```ruby
  Cryptozoologist.configure do |config|
    config.exclude = [:common, :paint]
    config.include = [:quantity]
    config.order = [:colors, :animals, :clothing]
    config.delimiter = '_'
  end

  Cryptozoologist.random # => 'masses_yellow_zombie_shrug'
  Cryptozoologist.random # => 'gazillions_purple_goblin_umbrella'
  Cryptozoologist.random # => 'wide_orange_cynocephalus_helmet'
  Cryptozoologist.random # => 'some_light_pink_moke_fedora'
```
