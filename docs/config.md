# Configuration

You can configure Cryptozoologist to do the following:

- include extra dictionaries
- exclude subsets of dictionaries
- change the order of words in the [`random`](random.md) method
- change the delimiter for the [`random`](random.md) method

## Usage

You should configure your settings **once**. If you call `configure` more than once, it will _remove any previous settings_ and use the new ones instead.

Configuration blocks look like this:

```ruby
  Cryptozoologist.configure do |config|
    config.exclude = []
    config.include = []
    config.order = []
    config.delimiter = ''
  end
```

## Options

- `exclude` (array of symbols) allows you to exclude dictionary subtypes; defaults to no exclusions
- `include` (array of symbols) allows you to include optional dictionaries; defaults to no inclusions
- `order` (array of symbols) allows you to change the word order; defaults to `animal-color-clothing`
- `delimiter` (string) allows you to specify a delimiter; defaults to `-`

### Include

Options: array of symbols

- `:quantity`: adds words from the `Quantity` dictionary to the end of your string when calling the `random` method

Example:

```ruby
  Cryptozoologist.configure do |config|
    config.include = [:quantity]
  end
```

### Exclude

Options: array of symbols

- animals (1 of 2 allowed):
  - `:common`, `:mythical`
- colors (1 of 2 allowed):
  - `:paint`, `:web`

**Note:** you can only use _2 exclusions_ in your config, once from each dictionary. 

Valid:

```ruby
  Cryptozoologist.configure do |config|
    config.exclude = [:common, :paint]
  end
```

Invalid:

```ruby
  # no animal dictionaries
  Cryptozoologist.configure do |config|
    config.exclude = [:common, :mythical]
  end

  # no color dictionaries
  Cryptozoologist.configure do |config|
    config.exclude = [:paint, :web]
  end

  # what are you doing?!
  Cryptozoologist.configure do |config|
    config.exclude = [:common, :paint, :web]
  end
```

### Order

Options: array of symbols, **must provide 3 keys**

- `[:animals, :colors, :clothing]`

```ruby
  Cryptozoologist.configure do |config|
    config.order = [:colors, :clothing, :animals]
  end
```

### Delimiter:

Options: string, any length (defaults to `-`)

**Note**: this only changes the output for the `random` method.

```ruby
  Cryptozoologist.configure do |config|
    config.delimiter = "_"
  end
```

## Example with all possible settings

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
