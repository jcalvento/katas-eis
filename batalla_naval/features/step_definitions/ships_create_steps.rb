require_relative '../../model/board'
require_relative '../../model/ship'
require_relative '../../model/coordinate'

Given(/^a board with dimensions "([^"]*)" x "([^"]*)"$/) do |width, height|
  @board = Board.with_dimensions width.to_i, height.to_i
end

Given(/^I create a small ship in position "([^"]*)"$/) do |position|
  @board.add_ship_in coordinate_from(position), SmallShip.new
end

Then(/^position "([^"]*)" is not empty$/) do |position|
  expect(@board.is_empty? coordinate_from(position)).to be_falsey
end

Given(/^I create a large ship in position "([^"]*)"$/) do |position|
  @board.add_ship_in coordinate_from(position), LargeShip.new
end

private

def coordinate_from a_string_position
  split_position = a_string_position.split(':')
  Coordinate.new split_position.first.to_i, split_position[1].to_i
end