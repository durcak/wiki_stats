require 'rspec'
$LOAD_PATH << File.expand_path(File.join(__dir__, '..'))
ENV['RACK_ENV'] = 'test'

module RSpecMixin
end

RSpec.configure { |c| c.include RSpecMixin }
