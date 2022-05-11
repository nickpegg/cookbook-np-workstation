[![Tests](https://github.com/nickpegg/cookbook-np-workstation/actions/workflows/tests.yml/badge.svg)](https://github.com/nickpegg/cookbook-np-workstation/actions/workflows/tests.yml)

# np-workstation
Sets up a personal workstation the way I like it

## Personal Cookbook Notice
This is a very personal cookbook, you probably set up your workstation a little
differently than I do, but at least you can get some ideas from this or use it
as a starting point.

## Testing
It's assumed that you have chefdk installed.

```bash
bundle install --path .bundle
bundle exec rubocop
bundle exec rspec
bundle exec kitchen test
```
