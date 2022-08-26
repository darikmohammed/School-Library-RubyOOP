require './app'
require './student'
require './teacher'
require './books'
require './rental'

class Main
  include App

  def initialize
    @books = []
    @peoples = []
    @rentals = []
  end

  def main
    puts 'WELCOME TO SCHOOL LIBRARY APP!!!!'
    puts "*********************************\n\n\n"

    puts 'Please choose an option by entering a number:'
    puts '1 - LIST ALL BOOKS'
    puts '2 - LIST ALL PEOPLES'
    puts '3 - CREATE A PERSON'
    puts '4 - CREATE A BOOK'
    puts '5 - CREATE A BOOK RENTAL'
    puts '6 - LIST ALL RENTALS FOR A GIVEN PERSON ID'
    puts "7 - EXIT\n\n"
    user_choice = gets.chomp
    display(user_choice)
  end

  def display(user_choice)
    case user_choice
    when '1'
      list_books(@books)
      main
    when '2'
      list_peoples(@peoples)
      main
    when '6'
      filter_rental
      main
    when '7'
      puts '=*=*=*='
      puts 'Thanks!'
      puts '=*=*=*='
    else
      add(user_choice)
    end
  end

  def add(user_choice)
    case user_choice
    when '3'
      add_person
      main
    when '4'
      add_book
      main
    when '5'
      rental_add
      main
    end
  end

  def filter_rental
    if @peoples.empty? || @rentals.empty?
      puts 'NO RENTALS TO DISPLAY'
    else
      puts 'Select a person id'
      @peoples.each_with_index { |people, index| puts "#{index}: #{people.name}" }
      id = gets.chomp.to_i
      list_rentals(@rentals, @peoples[id].name)
    end
  end

  def add_person
    puts 'Do you want to add Student (1) or Teacher (2) :'
    add_person_choice = gets.chomp
    case add_person_choice
    when '1'
      student_add
    when '2'
      teacher_add
    end
  end

  def student_add
    puts 'Adding Student...'
    print 'NAME: '
    name = gets.chomp
    print 'AGE: '
    age = gets.chomp
    print 'PARENT PERMISSION [Y/N]: '
    permission = gets.chomp
    print 'Classroom: '
    classroom = gets.chomp
    parent_permission = get_permission(permission)
    create_people(@peoples, Student.new(classroom, age, name, parent_permission: parent_permission))
    puts "Student has been sucessfully created! \n\n"
  end

  def teacher_add
    puts 'Adding Teacher...'
    print 'NAME: '
    name = gets.chomp
    print 'AGE: '
    age = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    create_people(@peoples, Teacher.new(specialization, age, name))
    puts "Teacher has been sucessfully created! \n\n"
  end

  def add_book
    puts 'Adding Book...'
    print 'TITLE: '
    title = gets.chomp
    print 'AUTHOR: '
    author = gets.chomp
    create_book(@books, Books.new(title, author))
    puts "Book has been sucessfully created! \n\n"
  end

  def rental_add
    puts 'Adding Book Rental...'
    if @books.empty?
      puts "\nNO BOOKS TO RENT!!!!\n"
    elsif @peoples.empty?
      puts "\nNO PEOPLE TO RENT!!!!\n"
    else
      puts 'Select a Book: '
      @books.each_with_index { |book, index| puts "#{index}: #{book.title} (#{book.author}) " }
      rent_book_id = gets.chomp.to_i
      @peoples.each_with_index { |people, index| puts "#{index}: #{people.name}" }
      rental_people_id = gets.chomp.to_i
      create_rental(@rentals, Rental.new(@books[rent_book_id], @peoples[rental_people_id]))
      puts "Rental has been sucessfully created! \n\n"
    end
  end

  def get_permission(permission)
    return true if permission.upcase == 'Y'

    false
  end
end

main = Main.new

main.main
