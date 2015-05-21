require_relative 'models/board'
require 'padrino'

module Battleship
  class App < Padrino::Application
    register Padrino::Rendering
    register Padrino::Helpers

    enable :sessions

    get '' do
      render 'batalla/inicio'
    end

    post 'create-board' do
      @board = Board.with_dimensions params[:width].to_i, params[:height].to_i
      session[:board] = @board

      render 'batalla/juego'
    end

    post 'create-small-ship' do
      coordinate = Coordinate.new params[:x].to_i, params[:y].to_i

      session[:board].add_small_ship_in coordinate, Ship.small_ship
      @board = session[:board]

      render 'batalla/juego'
    end

    post 'attack' do
      coordinate = Coordinate.new params[:x].to_i, params[:y].to_i

      @message = session[:board].shoot coordinate
      @board = session[:board]

      render 'batalla/juego'
    end

  end
end