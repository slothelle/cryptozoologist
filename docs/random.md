# `Cryptozoologist.random`

|----|----|
| Returns | String |
| Respects config? | Yes |
| Arguments | none |

## Description

`Cryptozoologist.random`: returns a string separated by a delimiter of your choosing containing: a color, an animal, and an item of clothing. The default delimiter is `-`. 

If your config includes the `Quantity` dictionary, it will be **prepended** to your string.

If your config changes the order of the dictionaries, `random` will respect that configuration. 

For information about customizing the delimiter, see [Config](config.md).

_Note_: aliased as `Cryptozoologist.generate` for backwards compatibility with anything below version 3

## Usage

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