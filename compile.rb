require 'sass'

html_filename, scss_filename = ARGV
scss_file = File.open(scss_filename, 'r')
html_file = File.open(html_filename, 'r')
engine = Sass::Engine.new(scss_file.read, syntax: :scss, style: :compressed)
rendered = engine.render
puts html_file.read.gsub(/##csshere##/, rendered)
html_file.close
scss_file.close
