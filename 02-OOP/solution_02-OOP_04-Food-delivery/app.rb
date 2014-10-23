#!/usr/bin/env ruby -w

$LOAD_PATH.unshift "#{__dir__}/lib"

require 'views/cli'

CLI.new.run
