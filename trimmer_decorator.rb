require './decorator_name'

# TrimmerDecorator
class TrimmerDecorator < DecoratorName
  def correct_name
    @nameable.correct_name[0, 10]
  end
end
