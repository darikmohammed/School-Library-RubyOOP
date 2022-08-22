class Person 
    attr_accessor :name, :age
    attr_reader :id

    def def initialize(name = 'Unknown', parent_permission = true, age)
        @id = Random.rand(1...100_000)
        @name = name
        @parent_permission = parent_permission
        @age = age
    end

    private 

    def is_of_age? 
        return true if @age >= 18
        false
    end

    public 

    def can_use_services? 
        return true if is_of_age? || @parent_permission
        false
    end
end