require 'matrix'
require_relative 'coordinate'
require_relative 'cell'

class Board
  attr_reader :width, :height

  def self.with_dimensions width, height
    self.new width, height
  end

  def initialize width, height
    @width = width
    @height = height
    @cells = Matrix.build(height, width) { |row, column| Cell.new }
  end

  def add_ship_in a_position, a_ship
    validate a_position
    a_ship.accept a_position, self
  end

  def is_empty? a_position
    cell_in(a_position).is_empty?
  end

  def add_small_ship_in a_position, a_ship
    cell_in(a_position).add a_ship
  end

  def add_large_ship_in a_position, a_ship
    cell_in(a_position).add a_ship
    second_position = Coordinate.new(a_position.x, a_position.y + 1)
    validate second_position
    cell_in(second_position).add a_ship
  end

  def shoot(a_position)
    cell_in(a_position).shoot
  end

  private

  def cell_in position
    @cells[position.y, position.x]
  end

  def validate a_position
    raise 'invalid position' unless a_position.x <= @cells.column_count - 1 && a_position.y <= @cells.row_count - 1
  end
end