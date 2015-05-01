require 'rspec'
require_relative '../model/board'

describe Board do

  it 'should create a board with dimensions 5 x 5' do
    board = Board.with_dimensions 5, 5

    expect(board.width).to eq 5
    expect(board.height).to eq 5
  end
end