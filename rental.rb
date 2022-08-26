# Rental class
class Rental
  attr_accessor :date
  attr_reader :person

  def initialize(book, person, date = Time.now)
    @date = date
    @book = book
    @person = person
    book.rentals.push(self)
    person.rentals.push(self)
  end

  def rentals
    "#{@book.title}: #{@person.name} #{@date}"
  end
end
