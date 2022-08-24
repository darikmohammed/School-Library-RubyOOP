# APP class
class APP
  def list_books(books)
    if books.empty?
      puts 'NO BOOKS REGISTERED!'
      puts ' ================================== '
    else
      books.each do |book|
        puts "TITLE: #{book.title}"
        puts " AUTHOR #{book.author}"
        puts ' ================================== '
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
        puts ' ================================== '
      end
    end
  end

  def list_rentals(rentals)
    if rentals.empty?
      puts 'NO RENTALS REGISTERED!'
      puts ' ================================== '
    else
      rentals.each do |rental|
        puts "DATE: #{rental.date}"
        puts "BOOK: #{rental.book}"
        puts "PERSON: #{rental.person}"
        puts ' ================================== ' \
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
