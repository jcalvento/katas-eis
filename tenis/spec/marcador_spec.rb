require 'rspec'
require_relative '../model/marcador'

describe 'Marcador' do

  let(:marcador) { Marcador.new }
  let(:jugador1) { 'jugador1' }
  let(:jugador2) { 'jugador2' }

  before :each do
    marcador.empezar_partido_de jugador1, jugador2
  end

  def sumar_game_a un_jugador
    4.times do
      marcador.marcar_punto_para un_jugador
    end
  end

  describe 'cuando empieza el partido' do
    it 'ambos jugadores deberian tener 0 puntos' do
      expect(marcador.puntos_de(jugador1)).to eq 0
      expect(marcador.puntos_de(jugador2)).to eq 0
    end

    it 'ambos jugadores deberian tener 0 games ganados' do
      expect(marcador.games_de(jugador1)).to eq 0
      expect(marcador.games_de(jugador2)).to eq 0
    end

    it 'ambos jugadores deberian tener 0 sets ganados' do
      expect(marcador.sets_de(jugador1)).to eq 0
      expect(marcador.sets_de(jugador2)).to eq 0
    end
  end

  describe 'cuando un jugador marca un punto' do
    it 'se le suma un punto a ese jugador aumentando el marcador' do
      marcador.marcar_punto_para jugador1

      expect(marcador.puntos_de(jugador1)).to eq 15
      expect(marcador.puntos_de(jugador2)).to eq 0
    end

    it 'teniendo 15, su proximo puntaje es 30' do
      2.times do
        marcador.marcar_punto_para jugador1
      end

      expect(marcador.puntos_de(jugador1)).to eq 30
      expect(marcador.puntos_de(jugador2)).to eq 0
    end

    it 'teniendo 30, su proximo puntaje es 40' do
      3.times do
        marcador.marcar_punto_para jugador1
      end

      expect(marcador.puntos_de(jugador1)).to eq 40
      expect(marcador.puntos_de(jugador2)).to eq 0
    end

    it 'teniendo 40, se le suma un game y el puntaje de ambos jugadores vuelve a 0' do
      marcador.marcar_punto_para jugador2 #para probar que vuelve a 0
      4.times do
        marcador.marcar_punto_para jugador1
      end

      expect(marcador.puntos_de(jugador1)).to eq 0
      expect(marcador.puntos_de(jugador2)).to eq 0
      expect(marcador.games_de(jugador1)).to eq 1
      expect(marcador.games_de(jugador2)).to eq 0
    end
  end

  describe 'cuando un jugador suma un game' do
    it 'teniendo 0, deberia sumar uno, quedando en 1 el valor de games ganados' do
      sumar_game_a jugador1

      expect(marcador.games_de(jugador1)).to eq 1
      expect(marcador.games_de(jugador2)).to eq 0
    end

    it 'teniendo 1, deberia sumar uno, quedando en 2 el valor de games ganados' do
      2.times do
        sumar_game_a jugador1
      end

      expect(marcador.games_de(jugador1)).to eq 2
      expect(marcador.games_de(jugador2)).to eq 0
    end

    it 'teniendo 5, deberia sumar un set y, tanto el puntaje como los games de ambos vuelven a 0' do
      sumar_game_a jugador2 #para testear que sus games vuelven a 0
      6.times do
        sumar_game_a jugador1
      end

      expect(marcador.games_de(jugador1)).to eq 0
      expect(marcador.games_de(jugador2)).to eq 0
      expect(marcador.puntos_de(jugador1)).to eq 0
      expect(marcador.puntos_de(jugador2)).to eq 0
      expect(marcador.sets_de(jugador1)).to eq 1
      expect(marcador.sets_de(jugador2)).to eq 0
    end
  end

  describe 'cuando un jugador gana un set' do
    it 'teniendo 1, suma uno y gana el partido' do
      11.times do
        sumar_game_a jugador1
      end

      expect{ sumar_game_a jugador1 }.to raise_exception("El ganador del partido es #{jugador1}")
    end
  end
end