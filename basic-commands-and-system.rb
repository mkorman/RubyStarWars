puts 'Hello. What is your name?'
name = gets
# double quotes for string interpolation
puts "Hello #{name}"

puts 'We use backticks to run a command and get the result'
puts `time /t`
puts 'We use system to run a command, output the result to console, and get a boolean representing execution OK'
puts system 'time /t'