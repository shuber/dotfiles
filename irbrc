#!/usr/bin/env ruby

require "rubygems"
require "irb/completion"
require "irb/ext/save-history"
require "pry"

IRB.conf[:SAVE_HISTORY] = 100000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

Pry.start

def r
  reload!
end
