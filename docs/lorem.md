# `Cryptozoologist.lorem(sentence_count)`

| It... | does this |
| -- | -- |
| Returns | String |
| Respects config? | Yes |
| Arguments | 1 (optional), integer |

## Description

`Cryptozoologist.lorem(sentence_count)` will return a string consisting of the number of sentences you request. Sentences are separated by punctuation randomly selected from a list: `["!", ".", "?"]`.

`sentence_count` is an optional argument, it will default to `1` sentence if no argument is provided.

## Usage

```ruby
Cryptozoologist.lorem(3) # => 'Black rhinoceros and it hundreds at flamingo dream oodles acres gear it plum serval shrug phoenix blazer washed khaki! Phantom mist the gazillions hem alicorn light golden rod yellow leopard cat troop and galoshes a be. Are there stellers sea cow billions be plum indri dodger blue shift to t shirt cheetah tiara tons sky blue miles?'

Cryptozoologist.lorem(1) # => 'And headscarf to potentially purple pygmy puff chocolate wide tights yak bundles the be?'
```