class Cell
  def initialize
    assign_state
  end

  def add a_ship
    @ship = a_ship
    assign_state
  end

  def is_empty?
    @ship.nil?
  end

  def shoot
    @state.shoot
  end

  private

  def assign_state
    @state = CellState.for self
  end
end

class CellState
  def self.subclasses
    ObjectSpace.each_object(::Class).select { |klass| klass < self }
  end

  def self.can_handle?
    self.subclass_responsibility
  end

  def self.for a_cell
    subclasses.detect { |klass| klass.can_handle? a_cell }.new
  end
end

class EmptyCell < CellState
  def self.can_handle? a_cell
    a_cell.is_empty?
  end

  def shoot

  end
end

class OccupiedCell < CellState
  def self.can_handle? a_cell
    !a_cell.is_empty?
  end

  def shoot
    'hit'
  end
end