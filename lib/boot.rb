# frozen_string_literal: true

require 'rubygems'
require 'bundler'

ENV['RACK_ENV'] ||= ENV.fetch('RACK_ENV', 'development')

Bundler.require(:default, ENV['RACK_ENV'].to_sym)

$LOAD_PATH.unshift File.expand_path('.', File.dirname(__FILE__))
$LOAD_PATH.unshift File.expand_path('../app', File.dirname(__FILE__))

require 'constants'
require 'model/submission_bundle'
require 'model/order_item'
require 'model/order'
require 'model/media_bundles'
require 'algorithm/minimum_bundles'
