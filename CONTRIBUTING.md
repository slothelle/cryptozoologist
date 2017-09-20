# Contributing

Hello, friend! I would love to see a contribution from you to Cryptozoologist, either in the form of code, documentation, or a bug report.

Please note that all contributors are held to the [code of conduct](CODE_OF_CONDUCT.md) for this project.

Let's get down to business!

![](http://gifs.feministy.io/images/penguin.gif)

## Finding things to work on

I use a [Project](https://github.com/feministy/cryptozoologist/projects/1) to organize all of the work for Cryptozoologist. You can look there to find things that are ready to work on, or things that I need help defining the work for.

- **Ideas**: mostly a bunch of jumbled ideas that need more details before being considered as ready for work. If you see something in this list you'd like to see become a feature, or something you'd like to work on as a feature, open a new Issue using the [ISSUE_TEMPLATES/new_feature.md](new feature template).
- **To do**: issues that are ready to be worked on! If one of these sounds interesting to you, comment on it and get started!
- **In progress**: a combination of Issues and Pull Requests that are actively being worked on by someone.
- **Done**: completed work! Merged to master, and, _ideally_, released with a version bump.

## Suggesting new features

If you'd like to suggest a new feature, create a new issue using the [ISSUE_TEMPLATES/new_feature.md](new feature template).

## Adding new features

* If you want to add a new dictionary, you can, but make sure you follow the current namespacing patterns
* All new code should be tested, but I welcome in progress PRs for feedback on your code before you write tests (this is optional!)

## Reporting bugs

Encountered a bug? Oh no! File a bug report using the [ISSUE_TEMPLATES/bug_report.md](bug report template).

## Releasing

I try and release the gem fairly regularly when I add features. Whatever is on master is generally what's available in the most recent version release!

If there are a few new features that need to go out and are all close to being done at the same time, sometimes I will wait to merge multiple branches at once before building and releasing.

Generally, a release works like this:

- a branch, or a few branches, with enough changes to warrant a version bump are merged into master and the tests are passing
- [@feministy](https://github.com/feministy) builds the gem locally and publishes it to RubyGems
