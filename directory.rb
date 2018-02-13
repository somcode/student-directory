=begin
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
=end

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  students = []
  months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
  name = gets.chomp
  while !name.empty? do
    puts "Please enter cohort"
    while true do
    cohort = gets.chomp.capitalize.to_sym
    if cohort.empty?
      cohort = :November
      break
    elsif months.include?(cohort)
        cohort
        break
      else
        puts "cohort does not exist, please enter again"
      end
    end


    puts "Please enter hobbies"
    hobbies= gets.chomp
    puts "Please enter country of birth"
    country = gets.chomp
    students << {name: name, cohort: cohort.to_sym , hobbies: hobbies, country: country}
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
    puts "Name = #{name[:name]} (#{name[:cohort]} cohort), Hobbies = #{name[:hobbies]}, Country = #{name[:country]}".center(80)
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
