# encoding:utf-8
require 'rspec'
require 'pry'
require File.expand_path(File.join(__dir__, '..'))
ENV['RACK_ENV'] = 'test'

module RSpecMixin
end

RSpec.configure { |c| c.include RSpecMixin }
