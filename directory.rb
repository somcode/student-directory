def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    puts "Please enter hobbies"
    hobbies= gets.chomp
    puts "Please enter country of birth"
    country = gets.chomp
    students << {name: name, cohort: :november, hobbies: hobbies, country: country}
    puts "Now we have #{students.count} students"
    puts "Please Enter name"
    name = gets.chomp
  end
  students
end

def print_header
puts "The students of my cohort at Makers Academy".center(80)
puts "-------------".center(80)
end

def print(names)
  i = 0
  while i < names.count do
    name = names[i]
    puts "#{name[:name]} (#{name[:cohort]} cohort), hobbies = #{name[:hobbies]}, country = #{name[:country]}".center(80)
    i += 1
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(80)
end


students = input_students
print_header
print(students)
print_footer(students)
