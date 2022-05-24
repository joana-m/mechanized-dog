require_relative 'dog'

dog = Dog.new

init = '> Choose an initial position for the dog (x, y, f).'
puts init
input = gets.chomp.split(',')

# Initialization
start = true
while start == true
  if dog.drop!(input[0].to_i, input[1].to_i, input[2])
    start = false
    next
  else
    puts init
    start = true
    input = gets.chomp.split(',')
  end
end

# Actions
continue = true
while continue == true
  puts '> What do you want to do? (drop, walk, left, right, bark or quit)'
  choice = gets.chomp
  case choice
  when 'drop'
    puts '> Choose a position for the dog (x, y, f)'
    position = gets.chomp.split(',')
    dog.drop!(position[0].to_i, position[1].to_i, position[2])
  when 'walk'
    dog.walk!
  when 'left'
    dog.turn!('left')
  when 'right'
    dog.turn!('right')
  when 'bark'
    dog.bark
  when 'quit'
    continue = false
  else
    puts '> Please select among choices availables.'
  end
end
