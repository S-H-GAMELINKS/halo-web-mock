require 'thin'
require 'zeitwerk'

loader = Zeitwerk::Loader.new
loader.push_dir('./controllers')
loader.setup
