# lets put all student into an array
students = [
  "DR. Hanibal Lecter" ,
  "Darth Vader" ,
  "Nurse Ratched" ,
  "Michael Corleone" ,
  "Alex DeLarge" ,
  "The Wicked Witch of the West" ,
  "Terminator" ,
  "Freddy Krueger" ,
  "The Joker" ,
  "Joffrey Baratheon" ,
  "Norman Bates"
]
def print_header
puts "The students of Villains Academy"
puts "-------------"
end
def print(names)
  names.each do |name|
    puts name
  end
end
def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end
# nothings happen untill we call tne methods
print_header
print(students)
print_footer(students)
