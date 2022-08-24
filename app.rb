# APP class
module App
  def list_books(books)
    if books.empty?
      puts 'NO BOOKS REGISTERED!'
      puts '================================== '
      puts
    else
      books.each do |book|
        puts "TITLE: #{book.title}"
        puts "AUTHOR #{book.author}"
        puts '================================== '
        puts
      end
    end
  end

  def list_peoples(peoples)
    if peoples.empty?
      puts 'NO PEOPLES REGISTERED!'
    else
      peoples.each do |people|
        puts "ID: #{people.id}"
        puts "NAME:  #{people.name}"
        puts "AGE: #{people.age}"
        puts '=================================='
        puts
      end
    end
  end

  def list_rentals(rentals, name)
    if rentals.empty?
      puts "NO RENTALS REGISTERED FOR PERSON #{name}!"
      puts ' =================================='
    else
      puts 'Registered Rentals: '
      rentals.each do |rental|
        next if rental.person.name != name

        puts "DATE: #{rental.date}"
        puts rental.rentals
        puts ' =================================='
      end
    end
  end

  def create_people(peoples, people)
    peoples.push(people)
  end

  def create_book(books, book)
    books.push(book)
  end

  def create_rental(rentals, rental)
    rentals.push(rental)
  end
end
