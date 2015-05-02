require 'matrix'

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
    @cells[a_position.y, a_position.x].add a_ship
  end

  def is_empty? a_position
    @cells[a_position.y, a_position.x].is_empty?
  end
end

class Cell
  def add a_ship
    @ship = a_ship
  end

  def is_empty?
    @ship.nil?
  end
end