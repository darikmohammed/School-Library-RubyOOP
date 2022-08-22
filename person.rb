# Person class
class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1...100_000)
    @name = name
    @parent_permission = parent_permission
    @age = age
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end

  public

  def can_use_services?
    return true if is_of_age? || @parent_permission

    false
  end
end
