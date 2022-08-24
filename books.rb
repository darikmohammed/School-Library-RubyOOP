require './rental.rb'

# Books class
class Books
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(person, date)
    Rental.new(self, person, date)
  end
end
