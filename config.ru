require 'sinatra'
log = File.new('std.log', 'a')
$stdout.reopen(log) unless defined?(PhusionPassenger)
$stderr.reopen(log)
STDOUT.sync = true
STDERR.sync = true

$LOAD_PATH << File.join(__dir__)
$LOAD_PATH << File.join(__dir__, 'config')

require 'app'
run WikiStats
