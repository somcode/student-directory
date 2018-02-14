@students = []

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  @students = []
  months = [:January, :February, :March, :April, :May, :June, :July, :August, :September, :October, :November, :December]
  # replacing chomp method with strip method
  name = STDIN.gets.strip
  while !name.empty? do
    #ask user input for cohort , supply a default value if the value is empty
    #convert it to symbol, check for users typo
    puts "Please enter cohort"
    while true do
    cohort = STDIN.gets.strip.capitalize.to_sym
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
    puts "Please enter hobby"
    hobby= STDIN.gets.strip
    puts "Please enter country of birth"
    country = STDIN.gets.strip
    add_student_to_array(name, cohort, hobby, country)
    if @students.count == 1
      puts "Now we have 1 student"
    else
    puts "Now we have #{@students.count} students"
    end
    puts "Please Enter name"
    name = STDIN.gets.strip
  end
end

def add_student_to_array(name, cohort, hobby, country)
  @students << {name: name, cohort: cohort.to_sym , hobby: hobby, country: country}
end

#using center method to align the output
def print_header
puts "The students of my cohort at Makers Academy".center(80)
puts "-------------".center(80)
end

# adding more information like hobbies, country
def print_student_list
  #print the list if there is at least one student in there
  if @students.count > 0
    @students.each do |student|
      puts "Name = #{student[:name]} (#{student[:cohort]} cohort), hobby = #{student[:hobby]}, Country = #{student[:country]}".center(80)
    end
  end
end

#rewite the each method with while loop to print all students
def print_with_While
  i = 0
  while i < @students.count do
    student = @students[i]
    puts "Name = #{student[:name]} (#{student[:cohort]} cohort), hobby = #{student[:hobby]}, Country = #{student[:country]}".center(80)
    i += 1
  end
end

#print a number before a name
def print_with_index
  @students.each_with_index do |student, index|
    puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# print the students whose name begin with S
def print_with_letter
  @students.each do |student|
    if student[:name].chr == "S"
      puts student[:name]
    end
  end
end

#print the students whose name is shorter than 12
def print_with_less_twelve
  @students.each do |student|
    if student[:name].length < 12
      puts student[:name]
    end
  end
end

# print names by cohort
def print_by_cohort
  sorted_by_cohort = {}
  @students.each do |student|
    cohort = student[:cohort]
    students_name = student[:name]
    if sorted_by_cohort[cohort] == nil
      sorted_by_cohort[cohort] = []
    end
    sorted_by_cohort[cohort].push(student[:name])
  end
  puts "Students sorted by cohort:"
  sorted_by_cohort.each do |cohort, name_array|
    puts "#{cohort} students:"
    puts name_array
  end
end

def print_footer
  #using singular and plural form
  if @students.count == 1
    puts "Overall, we have 1 great student".center(80)
  else
    puts "Overall, we have #{@students.count} great students".center(80)
  end
end



# we are defining seperate methos to refactor interactive_menu using them
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I dont know what you mean, try again"
  end
end

# saving the data to a file
def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobby], student[:country]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

#loading the data from a file
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort, hobby, country = line.chomp.split(",")
  add_student_to_array(name, cohort, hobby, country)
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
  end
end


# refactored method
def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

=begin
#Adding an interactive menu and later we will refactor this method
def interactive_menu
  students = []
  loop do
    #1.print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    #2. read the input and save it to variable
    selection = gets.chomp
    #3.do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit #this will cause the program to terminate
    else
      puts "I don't know what you meant, try again "
    end
  end
end
=end


#students = input_students
#print_header
#print(students)
#print_with_While(students)
#print_with_index(students)
#print_with_letter(students)
#print_with_less_twelve(students)
#print_by_cohort(students)
#print_footer(students)
interactive_menu
