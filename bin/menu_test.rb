#!/usr/bin/env ruby

def array_to_menu_hash(arr)
  Hash[arr.each_with_index.map { |e, i| [i+1, e] }]
end

def print_menu menu_hash
  puts 'Choices:'
  menu_hash.each { |k,v| puts "#{k}) #{v}" }
  puts
end

def get_user_menu_choice menu_hash
  print 'Choice => '
  number = STDIN.gets.strip.to_i
  menu_hash.fetch(number, nil)
end

def show_menu menu_hash
  print_menu menu_hash
  get_user_menu_choice menu_hash
end

def user_menu_choice(choice_array)
  until choice = show_menu(array_to_menu_hash(choice_array)); end
  choice
end

array = %w{a b c d e}
choice = user_menu_choice(array)

puts "User choice was #{choice}"