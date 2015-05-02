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
    @state.shoot self
  end

  def shoot_down_ship
    @ship.got_shot_in self
  end

  def sunken_ship
    @ship = nil
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

  def shoot a_cell
    raise 'should be implemented in concrete subclasses'
  end
end

class EmptyCell < CellState
  def self.can_handle? a_cell
    a_cell.is_empty?
  end

  def shoot a_cell
    'water'
  end
end

class OccupiedCell < CellState
  def self.can_handle? a_cell
    !a_cell.is_empty?
  end

  def shoot a_cell
    a_cell.shoot_down_ship
  end
end