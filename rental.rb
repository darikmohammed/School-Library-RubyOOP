# Rental class
class Rental
  attr_accessor :date

  def initialize(book , person, date)
    @date = date
    @book = book
    @person = person
    book.rentals.push(self)
  end
end
