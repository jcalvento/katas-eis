class Ship
  def self.small_ship
    SmallShip.new
  end

  def self.large_ship
    LargeShip.new
  end

  def accept a_position, a_board
    raise 'should be implemented in concrete subclasses'
  end

  def got_shot_in a_cell
    raise 'should be implemented in concrete subclasses'
  end
end

class SmallShip
  def accept a_position, a_board
    a_board.add_small_ship_in a_position, self
  end

  def got_shot_in a_cell
    a_cell.sunken_ship
    'sink'
  end
end

class LargeShip
  def initialize
    @state = UndamagedShip.new
  end

  def accept a_position, a_board
    a_board.add_large_ship_in a_position, self
  end

  def got_shot_in a_cell
    @state.got_shot_in a_cell, self
  end

  def receive_damage
    @state = DamagedShip.new
    'hit'
  end
end

class LargeShipState
  def got_shot_in a_cell, a_ship
    raise 'should be implemented in concrete subclasses'
  end
end

class UndamagedShip < LargeShipState
  def got_shot_in a_cell, a_ship
    a_ship.receive_damage
  end
end

class DamagedShip < LargeShipState
  def got_shot_in a_cell, a_ship
    a_cell.sunken_ship
    'sink'
  end
end