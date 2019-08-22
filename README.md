# Blacklight::LocalePicker
A dropdown locale switcher for Blacklight apps

## Usage
How to use my plugin.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'blacklight-locale_picker'
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install blacklight-locale_picker
```

And then run the install generator:
```bash
$ rails generate blacklight:locale_picker:install
```
## Configuration
To add locales to your application, add an initializer.
```
Blacklight::LocalePicker::Engine.config.available_locales = ['en', 'es', 'pt-BR']
```

## Translations
`blacklight-locale_picker` ships with i18n-tasks to help manage translations. To run a translation health check, run:
```
$ bundle exec rake i18n:health
```
