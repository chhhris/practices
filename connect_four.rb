require 'rubygems'
require 'rack'

app = Proc.new do |env|
  [ 200, { 'Content-Type' => 'text/html' }, ['Barebones hello world.'] ]
end

Rack::Handler::WEBrick.run app, Port: 9000
# Rack::Handler::WEBrick.run method(:application), Port: 9000