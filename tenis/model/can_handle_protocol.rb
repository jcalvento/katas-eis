require_relative 'subclass_reponsibility_exception'

module CanHandleProtocol
  extend SubclassResponsibilityException

  def subclasses
    ObjectSpace.each_object(::Class).select { |klass| klass < self }
  end

  def can_handle?
    self.subclass_responsibility
  end
end