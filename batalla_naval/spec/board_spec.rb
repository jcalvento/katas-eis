require 'rspec'
require_relative '../model/board'
require_relative '../model/coordinate'
require_relative '../model/small_ship'

describe Board do

  let(:board) { Board.with_dimensions 5, 5 }

  it 'should create a board with dimensions 5 x 5' do
    expect(board.width).to eq 5
    expect(board.height).to eq 5
  end

  it 'should add a ship in 3:3' do
    position = Coordinate.new(3, 3)

    board.add_ship_in position, SmallShip.new

    expect(board.is_empty? position).to be_falsey
  end

  it "when there's no ship, the position is empty" do
    position = Coordinate.new(3, 3)

    expect(board.is_empty? position).to be_truthy
  end
end