# frozen_string_literal: true

ENV['RACK_ENV'] = 'test'

require 'simplecov'
SimpleCov.start do
  add_filter 'spec/'
  minimum_coverage 100
end

require 'rubygems'
require 'bundler'
$LOAD_PATH.unshift File.expand_path('../app', File.dirname(__FILE__))

require 'rspec/its'
require 'boot'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
end
