require './decorator_name'

# CapitalizeDecorator
class CapitalizeDecorator < DecoratorName
  def correct_name
    @nameable.correct_name.capitalize
  end
end
