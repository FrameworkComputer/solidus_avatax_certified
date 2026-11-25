# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

solidus_branch = ENV.fetch('SOLIDUS_BRANCH', 'main')

gem 'solidus', github: 'solidusio/solidus', branch: solidus_branch
gem 'solidus_auth_devise'

# The solidus_frontend gem has been pulled out since v3.2. The 4.8.0 release
# depends on canonical-rails, which caps actionview below 8.1, so pin the
# GitHub commit that vendors the canonical tag helper instead.
if solidus_branch == 'main' || solidus_branch >= 'v3.2'
  gem 'solidus_frontend', github: 'solidusio/solidus_frontend', ref: '16546d19'
else
  gem 'solidus_frontend', github: 'solidusio/solidus', branch: solidus_branch
end

# Needed to help Bundler figure out how to resolve dependencies,
# otherwise it takes forever to resolve them.
# See https://github.com/bundler/bundler/issues/6677
gem 'rails', ENV.key?('RAILS_VERSION') ? "~> #{ENV['RAILS_VERSION']}.0" : '>0.a'

case ENV['DB']
when 'postgresql'
  gem 'pg'
when 'mysql'
  gem 'mysql2'
else
  gem 'sqlite3'
end

gemspec
