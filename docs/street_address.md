# `Cryptozoologist.street_address`

|----|----|
| Returns | String |
| Respects config? | NO |
| Arguments | none |

## Description

`Cryptozoologist.street_address` returns a string formatted to _US street address standards_ (house number and street name) using the animal dictionaries.

**Note:** ignores animal subdictionary exclusions!

Haven't you always wanted a cool address like 12 Pygmy Puff Court? Me, too. 

## Usage

```ruby
Cryptozoologist.street_address # => 2295 Red Panda Avenue
Cryptozoologist.street_address # => 947 Valkyrie Way
Cryptozoologist.street_address # => 2415 Goblin Street
Cryptozoologist.street_address # => 2558 Sea Dragon Court
```
