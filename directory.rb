# lets put all student into an array
students = [
  ["DR. Hanibal Lecter" ,:november],
  ["Darth Vader" ,:november],
  ["Nurse Ratched" ,:november],
  ["Michael Corleone" ,:november],
  ["Alex DeLarge" ,:november],
  ["The Wicked Witch of the West" ,:november],
  ["Terminator" ,:november],
  ["Freddy Krueger" ,:november],
  ["The Joker" ,:november],
  ["Joffrey Baratheon" ,:november],
  ["Norman Bates" ,:november]
]
def print_header
puts "The students of Villains Academy"
puts "-------------"
end
def print(names)
  names.each do |name|
    puts "#{name[0]}  (#{name[1]} cohort)"
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
# nothings happen untill we call tne methods
print_header
print(students)
print_footer(students)
