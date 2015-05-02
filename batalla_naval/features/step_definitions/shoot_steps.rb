Given(/^a large ship in position: “(\d+):(\d+)”$/) do |x, y|
  coordinate = Coordinate.new x.to_i, y.to_i

  @board.add_ship_in coordinate, LargeShip.new
end

Given(/^I shoot to position “(\d+):(\d+)”$/) do |x, y|
  coordinate = Coordinate.new x.to_i, y.to_i

  @result = @board.shoot coordinate
end

Then(/^I get hit$/) do
  expect(@result).to eq 'hit'
end

Then(/^I get water$/) do
  expect(@result).to eq 'water'
end

Then(/^I get sink$/) do
  pending # Write code here that turns the phrase above into concrete actions
end