class EstadoDeMarcador

  def self.subclasses
    ObjectSpace.each_object(::Class).select { |klass| klass < self }
  end

  def self.para un_puntaje, otro_puntaje
    subclass = subclasses.detect { |subclass| subclass.can_handle? un_puntaje, otro_puntaje }
    subclass.new
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