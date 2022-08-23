# Nameable class
class Nameable
  def correct_name
    raise NotImplementedError, "#{self.class} not implemented its method '#{__method__}'"
  end
end
