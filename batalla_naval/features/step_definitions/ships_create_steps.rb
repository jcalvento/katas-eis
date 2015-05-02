require_relative '../../model/board'
require_relative '../../model/ship'
require_relative '../../model/coordinate'

Given(/^a board with dimensions "([^"]*)" x "([^"]*)"$/) do |width, height|
  @board = Board.with_dimensions width.to_i, height.to_i
end

Given(/^I create a small ship in position "([^"]*)"$/) do |position|
  split_position = position.split(':')
  coordinate = Coordinate.new split_position.first.to_i, split_position[1].to_i

  @board.add_ship_in coordinate, SmallShip.new
end

Then(/^position "([^"]*)" is not empty$/) do |position|
  split_position = position.split(':')
  coordinate = Coordinate.new split_position.first.to_i, split_position[1].to_i

  @board.is_empty? coordinate
end

Given(/^I create a large ship in position "([^"]*)"$/) do |position|
  split_position = position.split(':')
  coordinate = Coordinate.new split_position.first.to_i, split_position[1].to_i

  @board.add_ship_in coordinate, LargeShip.new
end