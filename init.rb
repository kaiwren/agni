require 'rubygems'
require 'net/http'
require 'net/https'
require 'forwardable'
require 'date'
require 'cgi'
require 'base64'
require 'logger'

AGNI_ROOT = File.dirname(__FILE__)

module Agni
  def self.logger=(logger)
    @logger = logger
  end
  
  def self.logger
    @logger
  end
end

Agni.logger = Logger.new(STDOUT)
Agni.logger.level = Logger::DEBUG

["/lib/agni/core_ext/*.rb", "/lib/agni/*.rb"].each{|directory|
  Dir["#{File.expand_path(File.dirname(__FILE__) + directory)}"].each { |file|
    require file
  }
}
