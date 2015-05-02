require 'rspec'
require_relative '../model/board'
require_relative '../model/coordinate'
require_relative '../model/ship'

describe Board do

  let(:board) { Board.with_dimensions 5, 5 }

  it 'should create a board with dimensions 5 x 5' do
    expect(board.width).to eq 5
    expect(board.height).to eq 5
  end

  it 'should add a small ship in 3:3' do
    position = Coordinate.new(3, 3)

    board.add_ship_in position, SmallShip.new

    expect(board.is_empty? position).to be_falsey
  end

  it "should add a large ship in 3:3, so position 3:3 and 3:4 shouldn't be empty" do
    position = Coordinate.new(3, 3)

    board.add_ship_in position, LargeShip.new

    expect(board.is_empty? position).to be_falsey
    expect(board.is_empty? Coordinate.new(3, 4)).to be_falsey
  end

  it 'should raise an exception when adding a large ship at the limit' do
    position = Coordinate.new(4, 4)

    expect{ board.add_ship_in position, LargeShip.new }.to raise_exception 'invalid position'
  end

  it "when there's no ship, the position is empty" do
    position = Coordinate.new(3, 4)

    expect(board.is_empty? position).to be_truthy
  end
end