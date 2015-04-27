module CanHandleProtocol

  def subclasses
    ObjectSpace.each_object(::Class).select { |klass| klass < self }
  end

  def can_handle?
    self.subclass_responsibility
  end

end