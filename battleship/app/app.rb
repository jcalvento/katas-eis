require_relative 'models/board'

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

      begin
        session[:board].add_small_ship_in coordinate, Ship.small_ship
      rescue Exception => e
        @small_creation_message = e.message
      end

      @board = session[:board]

      render 'batalla/juego'
    end

    post 'create-large-ship' do
      coordinate = Coordinate.new params[:x].to_i, params[:y].to_i

      begin
        session[:board].add_large_ship_in coordinate, Ship.large_ship
      rescue Exception => e
        @large_creation_message = e.message
      end

      @board = session[:board]

      render 'batalla/juego'
    end

    post 'attack' do
      coordinate = Coordinate.new params[:x].to_i, params[:y].to_i

      begin
        @message = session[:board].shoot coordinate
      rescue Exception => e
        @message = e.message
      end

      @board = session[:board]

      render 'batalla/juego'
    end

  end
end