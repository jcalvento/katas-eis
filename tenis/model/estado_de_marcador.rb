require_relative 'can_handle_protocol'

class EstadoDeMarcador
  extend CanHandleProtocol

  def self.para un_puntaje, otro_puntaje
    subclass = self.subclasses.detect { |subclass| subclass.can_handle? un_puntaje, otro_puntaje }
    subclass.new
  end

  def sumar_punto_a un_puntaje
    self.subclass_responsibility
  end

end

class Deuce < EstadoDeMarcador

  def self.can_handle? un_puntaje, otro_puntaje
    un_puntaje.tiene_cuarenta_puntos? && otro_puntaje.tiene_cuarenta_puntos?
  end

  def sumar_punto_a un_puntaje
    un_puntaje.marcar_ventaja
  end

end

class NoEmpatado < EstadoDeMarcador

  def self.can_handle? un_puntaje, otro_puntaje
    !un_puntaje.tiene_cuarenta_puntos? || !otro_puntaje.tiene_cuarenta_puntos?
  end

  def sumar_punto_a un_puntaje
    un_puntaje.sumar_punto
  end
  
end