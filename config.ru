$: << 'lib'
require 'rubygems'
require 'bundler'

Bundler.require

require 'rack/static'
require 'rack-rewrite'

class Application < Sinatra::Base; end

use Rack::Rewrite do
  rewrite %r{^(.*)\/(\?(.*))?$}, '$1/index.html'
end

use Rack::Static, :urls => ["/index.html",
                            "/favicon.ico",
                            "/stylesheets",
                            "/javascripts",
                            "/images",
                            "/fonts"], :root => "public"
run Application.new
