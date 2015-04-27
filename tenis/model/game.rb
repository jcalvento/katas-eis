class Game

  def self.subclasses
    ObjectSpace.each_object(::Class).select { |klass| klass < self }
  end

  def self.para_comenzar
    GameComun.con_cantidad_ganada 0
  end

  def self.para_cantidad_ganada una_cantidad
    subclasses.detect { |subclass| subclass.can_handle? una_cantidad }.con_cantidad_ganada una_cantidad
  end

  def sumar_game_en un_puntaje
    raise 'Deberia implementarse en las subclases concretas'
  end

end

class GameComun < Game

  attr_reader :valor

  def self.can_handle? una_cantidad
    una_cantidad < 5
  end

  def self.con_cantidad_ganada una_cantidad
    self.new una_cantidad
  end

  def initialize una_cantidad
    @valor = una_cantidad
  end

  def sumar_game_en un_puntaje
    self.class.superclass.para_cantidad_ganada(@valor + 1)
  end

end

class GameFinal < Game

  attr_reader :valor

  def self.can_handle? una_cantidad
    una_cantidad.equal? 5
  end

  def self.con_cantidad_ganada una_cantidad
    self.new
  end

  def initialize
    @valor = 5
  end

  def sumar_game_en un_puntaje
    un_puntaje.sumar_set
    self.class.superclass.para_cantidad_ganada 0
  end

end