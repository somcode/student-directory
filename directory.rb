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
  names.each do |name|
    puts "#{name[:name]} (#{name[:cohort]} cohort)"
  end
end

def print_with_While(names)
  i = 0
  while i < names.count do
    name = names[i]
    puts "Name = #{name[:name]} (#{name[:cohort]} cohort), Hobbies = #{name[:hobbies]}, Country = #{name[:country]}".center(80)
    i += 1
  end
end

def print_with_index(names)
  names.each_with_index do |name, index|
    puts "#{index+1} #{name[:name]} (november cohort)"
  end
end

def print_with_letter(names)
  names.each do |name|
    if name[:name].chr == "S"
      puts name[:name]
    end
  end
end

def print_with_less_twelve(names)
  names.each do |name|
    if name[:name].length < 12
      puts name[:name]
    end
  end
end

def print_by_cohort(names)
  sorted_by_cohort = {}
  names.each do |name|
    cohort = name[:cohort]
    students_name = name[:name]
    if sorted_by_cohort[cohort] == nil
      sorted_by_cohort[cohort] = []
    end
    sorted_by_cohort[cohort].push(name[:name])
  end
  puts "Students sorted by cohort:"
  sorted_by_cohort.each do |cohort, name_array|
    puts "#{cohort} students:"
    puts name_array
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students".center(80)
end

students = input_students
print_header
print_by_cohort(students)
print_footer(students)
