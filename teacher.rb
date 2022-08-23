require './person'

# Teacher Class
class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(name, parent_permission, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
