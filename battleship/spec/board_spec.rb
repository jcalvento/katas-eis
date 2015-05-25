require 'rspec'
require_relative '../app/models/board'
require_relative '../app/models/coordinate'
require_relative '../app/models/ship'

describe Board do

  let(:board) { Board.with_dimensions 5, 5 }
  let(:coordinate3_3) { Coordinate.new(3, 3) }

  before :each do
    board
  end

  it 'should create a board with dimensions 5 x 5' do
    expect(board.width).to eq 5
    expect(board.height).to eq 5
  end

  it 'should add a small ship in 3:3' do
    board.add_ship_in coordinate3_3, Ship.small_ship

    expect(board.is_empty? coordinate3_3).to be_falsey
  end

  it "should add a large ship in 3:3, so position 3:3 and 3:4 shouldn't be empty" do
    board.add_ship_in coordinate3_3, Ship.large_ship

    expect(board.is_empty? coordinate3_3).to be_falsey
    expect(board.is_empty? Coordinate.new(3, 4)).to be_falsey
  end

  it 'should raise an exception when adding a large ship at the limit' do
    position = Coordinate.new(4, 4)

    expect{ board.add_ship_in position, Ship.large_ship }.to raise_exception 'invalid position'
  end

  it "when there's no ship, the position is empty" do
    position = Coordinate.new(3, 4)

    expect(board.is_empty? position).to be_truthy
  end

  describe 'shoot' do
    it "should get 'hit' when I shoot a non empty position" do
      board.add_ship_in coordinate3_3, Ship.large_ship

      expect(board.shoot coordinate3_3).to eq 'hit'
    end

    it "should get 'water' when I shoot an empty position" do
      expect(board.shoot coordinate3_3).to eq 'water'
    end

    it "should get 'sink' and empty the position when I shoot twice a large ship" do
      board.add_ship_in coordinate3_3, Ship.large_ship

      expect(board.shoot coordinate3_3).to eq 'hit'
      expect(board.shoot coordinate3_3).to eq 'sink'
      expect(board.is_empty? coordinate3_3).to be_truthy
    end

    it "should get 'sink' and empty the position when I shoot once a small ship" do
      board.add_ship_in coordinate3_3, Ship.small_ship

      expect(board.shoot coordinate3_3).to eq 'sink'
      expect(board.is_empty? coordinate3_3).to be_truthy
    end

    it 'should raise an exception when shooting to an invalid position' do
      expect{ board.shoot Coordinate.new(6, 3) }.to raise_error('invalid position')
    end
  end
end