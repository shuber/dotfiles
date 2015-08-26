#!/usr/bin/ruby

require 'rubygems'
require 'irb/completion'
require 'irb/ext/save-history'
require 'pry'
Pry.start

IRB.conf[:SAVE_HISTORY] = 10000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

class Object
  # List methods which aren't in superclass
  def local_methods(object = self)
    (object.methods - object.class.superclass.instance_methods).sort
  end

  # Print ri documentation
  #
  #   ri 'Array#pop'
  #   Array.ri
  #   Array.ri :pop
  #   arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end

    puts `ri '#{method}'`
  end
end

def r
  reload!
end
