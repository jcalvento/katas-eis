class Ship
  def accept a_position, a_board
    raise 'should be implemented in concrete subclasses'
  end
end

class SmallShip
  def accept a_position, a_board
    a_board.add_small_ship_in a_position, self
  end
end

class LargeShip
  def accept a_position, a_board
    a_board.add_large_ship_in a_position, self
  end
end