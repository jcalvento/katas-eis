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
  expect(@result).to eq 'sink'
end

Given(/^a small ship in position: “(\d+):(\d+)”$/) do |x, y|
  coordinate = Coordinate.new x.to_i, y.to_i

  @board.add_ship_in coordinate, SmallShip.new
end

When(/^I shoot to position “(\d+):(\d+)” I get an error message$/) do |x, y|
  expect{ @board.shoot(Coordinate.new x.to_i, y.to_i) }.to raise_exception('invalid position')
end